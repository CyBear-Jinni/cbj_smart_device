import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';

class SetDevicesD {
  Future<String> getCurrentDeviceUUid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  Future<String?> getDeviceDefaultConfig() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getDeviceConfiguration();
  }
}
