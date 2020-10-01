import '../system_commands_d/system_commands_manager_d.dart';

class SetDevicesD {
  Future<String> getCurrentDeviceUUid() {
    SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  Future<String> getDeviceDefaultConfig() {
    SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getDeviceConfiguration();
  }
}
