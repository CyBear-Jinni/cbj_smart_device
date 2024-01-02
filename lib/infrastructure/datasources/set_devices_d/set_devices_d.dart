import 'package:cbj_integrations_controller/integrations_controller.dart';

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
