import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getCurrentUserName();
  }
}
