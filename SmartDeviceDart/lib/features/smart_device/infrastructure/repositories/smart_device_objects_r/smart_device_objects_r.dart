import '../../datasources/smart_device_objects_d/smart_device_objects_d.dart';

class SmartDeviceObjectsR {
  static Future<String> getUuid() {
    return SmartDeviceObjectsD.getUuid();
  }
}
