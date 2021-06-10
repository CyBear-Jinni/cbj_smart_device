import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

class LightObject extends SmartDeviceSimpleAbstract {
  LightObject(
    String? uuid,
    String? smartInstanceName,
    int? onOffPinNumber,
  ) : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: null) {
    setDeviceType(DeviceTypes.light);
    print('New light object');
  }

  @override
  List<String> getNeededPinTypesList() => <String>['gpio'];

  @override
  static List<String> neededPinTypesList() => <String>['gpio'];

  @override
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  ///  Return smart device type
  @override
  DeviceTypes getDeviceType() => DeviceTypes.light;

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
    return wishInSimpleClass(deviceAction, deviceState);
  }
}
