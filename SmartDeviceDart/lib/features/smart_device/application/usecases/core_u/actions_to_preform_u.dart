import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

class ActionsToPreformU {
  static Future<String> executeDeviceAction(SmartDeviceBaseAbstract smartDevice,
      DeviceActions deviceAction, DeviceStateGRPC deviceStateSource) async {
    final deviceStatus =
        await smartDevice.executeDeviceAction(deviceAction, deviceStateSource);
    return deviceStatus;
  }
}
