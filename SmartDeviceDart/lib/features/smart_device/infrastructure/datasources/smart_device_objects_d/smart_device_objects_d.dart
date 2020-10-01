import '../system_commands_d/system_commands_manager_d.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }
}
