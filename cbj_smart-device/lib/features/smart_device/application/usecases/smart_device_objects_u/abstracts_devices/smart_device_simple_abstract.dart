import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBase {
  SmartDeviceSimpleAbstract(
      String? uuid, String? deviceName, int? onOffPinNumber,
      {int? onOffButtonPinNumber})
      : super(uuid, deviceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  ///  How much time the smart device was active (Doing action) continuously
  double? howMuchTimeTheDeviceDoingAction;

  @override
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  @override
  static List<String> neededPinTypesList() => [];

  @override
  Future<String> executeActionString(
      String deviceActionString, DeviceStateGRPC deviceState) async {
    final DeviceActions? deviceAction =
        convertWishStringToWishesObject(deviceActionString);
    return executeDeviceAction(deviceAction!, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) {
    if (deviceAction == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(deviceAction, deviceState);
  }
}
