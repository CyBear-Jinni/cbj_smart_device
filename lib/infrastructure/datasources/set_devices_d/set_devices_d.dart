import 'package:cbj_smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:cbj_smart_device/injection.dart';

class SetDevicesD {
  Future<String> getCurrentDeviceUUid() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  Future<String?> getDeviceDefaultConfig() {
    final SystemCommandsManager systemCommandsManager =
        getItSmartDevice<SystemCommandsManager>();
    return systemCommandsManager.getDeviceConfiguration();
  }
}
