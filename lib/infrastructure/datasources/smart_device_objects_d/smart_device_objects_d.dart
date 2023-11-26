import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }
}
