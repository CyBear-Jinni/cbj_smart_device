import 'package:cbj_smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:cbj_smart_device/injection.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getCurrentUserName();
  }

  static String getOs() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getOs();
  }

  static String getOsVersion() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getOsVersion();
  }

  static Future<String?> suspendComputer() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.suspendComputer();
  }

  static Future<String?> shutdownComputer() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.shutdownComputer();
  }
}
