import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.getCurrentUserName();
  }

  static String getOs() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.getOs();
  }

  static String getOsVersion() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.getOsVersion();
  }

  static Future<String?> suspendComputer() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.suspendComputer();
  }

  static Future<String?> shutdownComputer() {
    final SystemCommandsManager systemCommandsManager =
        SystemCommandsManager.instance;
    return systemCommandsManager.shutdownComputer();
  }
}
