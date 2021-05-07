import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';

class ThermostatObject extends SmartDeviceSimpleAbstract {
  ThermostatObject(
    String uuid,
    String smartInstanceName,
    int onOffPinNumber, // Not in use
    int onOffButtonPinNumber, // Not in use
    int thermostatPinNUmber, {
    int thermostatButtonPinNumber,
  }) : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber) {
    print('New thermostat object');
    thermostatPin = DevicePinListManager().getGpioPin(thermostatPinNUmber);
    thermostatButtonPin =
        DevicePinListManager().getGpioPin(thermostatButtonPinNumber);
    listenToTwoButtonsPress();
    setDeviceType(DeviceType.Thermostat);
  }

  PinInformation thermostatPin, thermostatButtonPin;

  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  @override
  void setDeviceType(DeviceType deviceType) => super.setDeviceType(deviceType);

  ///  Return smart device type
  @override
  DeviceType getDeviceType() => DeviceType.Thermostat;

  @override
  Future<String> executeWishString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    final WishEnum wish = convertWishStringToWishesObject(wishString);
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) async {
    return wishInThermostatClass(wishEnum, wishSourceEnum);
  }

  ///  All the wishes that are legit to execute from the blinds class
  Future<String> wishInThermostatClass(
      WishEnum wish, WishSourceEnum wishSourceEnum) async {
    String wishExecuteResult;

    if (wish == null) return 'Your wish does not exist in thermostat class';
    if (wish == WishEnum.SThermostatOn) {
      wishExecuteResult = OnWishU.setOn(deviceInformation, thermostatPin);
    }
    if (wish == WishEnum.SThermostatOff) {
      wishExecuteResult = OffWishU.setOff(deviceInformation, thermostatPin);
    }

    if (wishExecuteResult != null) {
      if (wishSourceEnum != WishSourceEnum.FireBase) {
        final String wishEnumString = EnumHelper.wishEnumToString(wish);
        super.updateThisDeviceDocumentCloudValue('action', wishEnumString);
        super.updateThisDeviceDocumentCloudValue('state', 'ack');
      }
      return wishExecuteResult;
    }

    return wishInSimpleClass(wish, wishSourceEnum);
  }

  void listenToTwoButtonsPress() {
    if (thermostatPin != null && thermostatButtonPin != null) {
      ButtonObjectLocalU()
          .buttonPressedForThermostat(this, thermostatButtonPin, thermostatPin);
    } else {
      print('Cannot listen to blinds, one of the variables is null');
    }
  }
}
