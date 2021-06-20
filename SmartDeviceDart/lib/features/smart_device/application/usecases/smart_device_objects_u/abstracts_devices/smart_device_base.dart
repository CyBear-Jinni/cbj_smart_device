import 'package:smart_device_dart/core/device_information.dart';
import 'package:smart_device_dart/core/helper_methods.dart';
import 'package:smart_device_dart/core/permissions/permissions_manager.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pb.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/smart_server_helper.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/smart_device_objects_r/smart_device_objects_r.dart';

///  Abstract class for smart devices that can get actions from commands.
///  Excluding buttons since they are the one that sending the commands.
abstract class SmartDeviceBase extends SmartDeviceBaseAbstract {
  SmartDeviceBase(String? id, String? deviceName, int? onOffPinNumber,
      {int? onOffButtonPinNumber})
      : super(id, deviceName) {
    onOffPin =
        onOffPinNumber == null ? null : addPinToGpioPinList(onOffPinNumber);

    //  If pin number was inserted and it exists than listen to button press
    if (onOffButtonPinNumber != null) {
      onOffButtonPin = addPinToGpioPinList(onOffButtonPinNumber);

      if (onOffButtonPin != null) {
        listenToButtonPressed();
      }
    }
    cloudValueChangeU = CloudValueChangeU.getCloudValueChangeU();
  }

  ///  Save data about the device, remote or local IP or pin number
  DeviceInformation deviceInformation =
      LocalDevice('This is the mac Address', '');

  ///  Mac addresses of the physical device
  String? uuid;

  ///  Permissions of all the users to this device
  Map<String, PermissionsManager>? devicePermissions;

  ///  Power consumption of the device
  double? watts;

  ///  How much time the computer is on since last boot
  DateTime? computerActiveTime;

  ///  How much time the smart device was active (Doing action) total
  DateTime? activeTimeTotal;

  ///  Log of all the actions the device was and will do
  Map<DateTime, Function>? activitiesLog;

  ///  Save the device state on = true, off = false of onOffPin
  bool onOff = false;

  ///  Number of on or off pin
  PinInformation? onOffPin;

  ///  Pin for the button that control the onOffPin
  PinInformation? onOffButtonPin;

  ///  Save all the gpio pins that this instance is using
  final List<PinInformation> _gpioPinList = <PinInformation>[];

  /// Instance to interact with the cloud
  CloudValueChangeU? cloudValueChangeU;

  ///  The type of the smart device Light blinds etc
  DeviceTypes? smartDeviceType;

  /// Get a list of the pins Types that this device need
  @override
  List<String> getNeededPinTypesList() => [];

  @override
  static List<String> neededPinTypesList() => [];

  //  Getters

  ///  Get smart device type
  DeviceTypes? getDeviceType() => smartDeviceType;

  /// Returning the non abstract of this object
  Type getTheNonAbstractObjectOfThisInstance() {
    return EnumHelper.getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
        this, getDeviceType()!);
  }

  /// Getting the saved IP of this object
  Future<String?> getIp() async {
    return getIps();
  }

  ///  Get the list of gpio pin of the device
  List<PinInformation> getGpioPinList() {
    return _gpioPinList;
  }

  Future<String> getUuid() {
    return SmartDeviceObjectsR.getUuid();
  }

  bool getDeviceState() => onOff;

  //  Setters

  ///  Turn on the device basic action
  String _SetOn(PinInformation? pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, can't turn on';
//    }
    OnWishU.setOn(deviceInformation, pinNumber);
    onOff = true;
    return 'Turn on successfully';
  }

  ///  Turn off the device basic action
  String _SetOff(PinInformation? pinNumber) {
//    if (deviceInformation == null) {
//      return 'Device information is missing, can't turn off';
//    }
    OffWishU.setOff(deviceInformation, pinNumber);
    onOff = false;
    return 'Turn off successfully';
  }

  void setDeviceType(DeviceTypes deviceType) => smartDeviceType = deviceType;

  ///  Turn device pin to the opposite state
  String _SetChangeOppositeToState(PinInformation? pinNumber) {
    return onOff ? _SetOff(onOffPin) : _SetOn(onOffPin);
  }

  //  More functions

  ///  Add gpio pin for this device
  PinInformation? addPinToGpioPinList(int pinNumber) {
    //  Check if pin is free to be taken,
    //  if not return negative number with error number
    final PinInformation gpioPin =
        DevicePinListManager().getGpioPin(pinNumber)!;
    if (gpioPin == null) {
      return null;
    }
    _gpioPinList.add(gpioPin);
    return gpioPin;
  }

  ///  Return PossibleWishes object if
  ///  string wish exist (in general) else return null
  DeviceActions? convertWishStringToWishesObject(String wish) {
    for (final DeviceActions possibleAction in DeviceActions.values) {
      print('Wish value ${EnumHelper.deviceActionToString(possibleAction)}');
      if (EnumHelper.deviceActionToString(possibleAction) == wish) {
        return possibleAction; //  If wish exist return the PossibleWish object
      }
    }
    return null;
  }

  ///  Check if wish exist at all if true than check if base abstract have
  ///  this wish and if true than execute it
  Future<String> executeActionString(
      String wishString, DeviceStateGRPC deviceState) async {
    final DeviceActions action = convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(action, deviceState);
  }

  Future<String> executeDeviceAction(
      DeviceActions action, DeviceStateGRPC deviceState) async {
    return wishInBaseClass(action, deviceState);
  }

  ///  All the wishes that are legit to execute from the base class
  String wishInBaseClass(DeviceActions action, DeviceStateGRPC deviceState) {
    String executionMassage = ' ';
    if (action == null) executionMassage = 'Your wish does not exist';

    final bool deviceStatus = getDeviceState();
    String resultOfTheWish = '';

    switch (action) {
      case DeviceActions.off:
        if (onOffPin == null) {
          executionMassage = 'Cant turn off this pin: $onOffPin Number';
        }
        resultOfTheWish = _SetOff(onOffPin);
        break;
      case DeviceActions.on:
        if (onOffPin == null) {
          executionMassage = 'Cant turn on this pin: $onOffPin Number';
        }
        resultOfTheWish = _SetOn(onOffPin);
        break;
      case DeviceActions.actionNotSupported:
        if (onOffPin == null) {
          executionMassage =
              'Cant change pin to the opposite state: $onOffPin Number';
        }
        resultOfTheWish = _SetChangeOppositeToState(onOffPin);
        break;
      default:
        executionMassage = 'Your wish does not exist for this class';
    }

    print('Execution massage: $executionMassage');

    if (resultOfTheWish == 'Turn on successfully' ||
        resultOfTheWish == 'Turn off successfully' ||
        executionMassage == 'Cant turn on this pin: null Number' ||
        executionMassage == 'Cant turn off this pin: null Number') {
      if (deviceState == DeviceStateGRPC.waitingInComp) {
        if (action == DeviceActions.on) {
          final Map<String, String> mapToUpdate = {
            GrpcClientTypes.deviceActionsTypeString:
                DeviceActions.on.toString(),
            GrpcClientTypes.deviceStateGRPCTypeString:
                DeviceStateGRPC.ack.toString()
          };
          updateDeviceDocumentWithMap(id!, mapToUpdate);
        } else if (action == DeviceActions.off) {
          final Map<String, String> mapToUpdate = {
            GrpcClientTypes.deviceActionsTypeString:
                DeviceActions.off.toString(),
            GrpcClientTypes.deviceStateGRPCTypeString:
                DeviceStateGRPC.ack.toString()
          };
          updateDeviceDocumentWithMap(id!, mapToUpdate);
        }
      } else if (deviceState == DeviceStateGRPC.ack) {
      } else {
        updateDeviceDocumentCloudValue(
            id!,
            GrpcClientTypes.deviceStateGRPCTypeString,
            DeviceStateGRPC.ack.toString());
      }
    } else {
      updateDeviceDocumentCloudValue(id!, 'stateMassage', executionMassage);
    }

    return executionMassage;
  }

  void updateDeviceDocumentCloudValue(
      String deviceId, String fieldToUpdate, String valueToUpdate) {
    cloudValueChangeU ??= CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      cloudValueChangeU!
          .updateDeviceDocument(deviceId, fieldToUpdate, valueToUpdate);
    }
  }

  void updateDeviceDocumentWithMap(
      String deviceId, Map<String, String> mapToUpdate) {
    cloudValueChangeU ??= CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      cloudValueChangeU!.updateDeviceDocumentWithMap(deviceId, mapToUpdate);
    }
  }

  void updateThisDeviceDocumentCloudValue(
      String fieldToUpdate, String valueToUpdate) {
    cloudValueChangeU ??= CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      cloudValueChangeU!
          .updateDeviceDocument(id!, fieldToUpdate, valueToUpdate);
    }
  }

  ///  Listen to button press
  Future<void> listenToButtonPressed() async {
    ButtonObjectLocalU().buttonPressed(this, onOffButtonPin!, onOffPin!);
  }
}
