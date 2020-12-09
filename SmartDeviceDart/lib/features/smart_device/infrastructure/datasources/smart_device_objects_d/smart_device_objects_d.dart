import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }
}
