import 'package:cbj_smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:cbj_smart_device/injection.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.getCurrentUserName();
  }

  static String getOs() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.getOs();
  }

  static String getOsVersion() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.getOsVersion();
  }

  static Future<String?> suspendComputer() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.suspendComputer();
  }

  static Future<String?> shutdownComputer() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.shutdownComputer();
  }
}
