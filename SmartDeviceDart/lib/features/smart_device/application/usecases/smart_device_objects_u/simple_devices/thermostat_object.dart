import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

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
    setDeviceType(DeviceTypes.Thermostat);
  }

  PinInformation thermostatPin, thermostatButtonPin;

  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  @override
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  ///  Return smart device type
  @override
  DeviceTypes getDeviceType() => DeviceTypes.Thermostat;

  @override
  Future<String> executeActionString(
      String wishString, DeviceStateGRPC deviceState) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString);
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    return wishInThermostatClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the blinds class
  Future<String> wishInThermostatClass(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    String wishExecuteResult;

    if (deviceAction == null) {
      return 'Your wish does not exist in thermostat class';
    }
    if (deviceAction == DeviceActions.ActionNotSupported) {
      wishExecuteResult = OnWishU.setOn(deviceInformation, thermostatPin);
    }
    if (deviceAction == DeviceActions.ActionNotSupported) {
      wishExecuteResult = OffWishU.setOff(deviceInformation, thermostatPin);
    }

    if (wishExecuteResult != null) {
      if (deviceState != DeviceStateGRPC.waitingInFirebase) {
        final String deviceActionString =
            EnumHelper.deviceActionToString(deviceAction);
        super.updateThisDeviceDocumentCloudValue('action', deviceActionString);
        super.updateThisDeviceDocumentCloudValue(
            'state', DeviceStateGRPC.ack.toString());
      }
      return wishExecuteResult;
    }

    return wishInSimpleClass(deviceAction, deviceState);
  }

  void listenToTwoButtonsPress() {
    if (thermostatPin != null && thermostatButtonPin != null) {
      ButtonObjectLocalU()
          .buttonPressedForThermostat(this, thermostatButtonPin, thermostatPin);
    } else {
      print('Cannot listen to thermostat, one of the variables is null');
    }
  }
}
