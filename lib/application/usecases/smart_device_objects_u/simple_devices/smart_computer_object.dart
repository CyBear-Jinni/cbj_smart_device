import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

class SmartComputerObject extends SmartDeviceSimpleAbstract {
  SmartComputerObject(
    String? uuid,
    String? smartInstanceName,
  ) : super(
          uuid,
          smartInstanceName,
          null,
          onOffButtonPinNumber: null,
        ) {
    setDeviceType(DeviceTypes.smartComputer);
    print('New smart computer object');
  }

  @override
  List<String> getNeededPinTypesList() => <String>[];

  @override
  static List<String> neededPinTypesList() => <String>[];

  ///  Return smart device type
  @override
  DeviceTypes getDeviceType() => DeviceTypes.smartComputer;

  @override
  Future<String> executeActionString(
    String wishString,
    DeviceStateGRPC deviceState,
  ) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    DeviceActions deviceAction,
    DeviceStateGRPC deviceState,
  ) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }
}
