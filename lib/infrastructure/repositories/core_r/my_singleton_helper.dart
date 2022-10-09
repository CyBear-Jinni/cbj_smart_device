import 'package:cbj_smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getCurrentUserName();
  }

  static Future<String?> suspendComputer() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.suspendComputer();
  }

  static Future<String?> shutdownComputer() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.shutdownComputer();
  }
}
