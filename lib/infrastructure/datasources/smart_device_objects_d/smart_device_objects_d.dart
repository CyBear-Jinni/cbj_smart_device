import 'package:cbj_smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:cbj_smart_device/injection.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager =
        getIt<SystemCommandsManager>();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }
}
