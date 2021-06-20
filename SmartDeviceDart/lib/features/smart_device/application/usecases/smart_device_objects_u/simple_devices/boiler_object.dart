import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/smart_server_helper.dart';

class BoilerObject extends SmartDeviceSimpleAbstract {
  BoilerObject(String? uuid, String? smartInstanceName, int? boilerPinNUmber,
      int? boilerButtonPinNumber,
      {int? onOffPinNumber, int? onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber) {
    print('New boiler object');
    boilerPin = DevicePinListManager().getGpioPin(boilerPinNUmber);
    boilerButtonPin = DevicePinListManager().getGpioPin(boilerButtonPinNumber);
    listenButtonsPress();
    setDeviceType(DeviceTypes.boiler);
  }

  PinInformation? boilerPin, boilerButtonPin;

  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  @override
  static List<String> neededPinTypesList() => <String>['gpio', 'gpio'];

  @override
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  ///  Return smart device type
  @override
  DeviceTypes getDeviceType() => DeviceTypes.boiler;

  @override
  Future<String> executeActionString(
      String wishString, DeviceStateGRPC deviceState) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    return wishInBoilerClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the blinds class
  Future<String> wishInBoilerClass(
      DeviceActions? deviceAction, DeviceStateGRPC deviceState) async {
    String? wishExecuteResult;

    if (deviceAction == null) {
      return 'Your wish does not exist in boiler class';
    }
    if (deviceAction == DeviceActions.on) {
      wishExecuteResult = OnWishU.setOn(deviceInformation, boilerPin);
    }
    if (deviceAction == DeviceActions.off) {
      wishExecuteResult = OffWishU.setOff(deviceInformation, boilerPin);
    }

    if (wishExecuteResult != null) {
      if (deviceState != DeviceStateGRPC.ack) {
        final String deviceActionString =
            EnumHelper.deviceActionToString(deviceAction);
        super.updateThisDeviceDocumentCloudValue(
            GrpcClientTypes.deviceActionsTypeString, deviceActionString);
        super.updateThisDeviceDocumentCloudValue(
            GrpcClientTypes.deviceStateGRPCTypeString,
            DeviceStateGRPC.ack.toString());
      }
      return wishExecuteResult;
    }

    return wishInSimpleClass(deviceAction, deviceState);
  }

  void listenButtonsPress() {
    if (boilerPin != null && boilerButtonPin != null) {
      ButtonObjectLocalU()
          .buttonPressedForBoiler(this, boilerButtonPin!, boilerPin!);
    } else {
      print('Cannot listen to boiler, one of the variables is null');
    }
  }
}
