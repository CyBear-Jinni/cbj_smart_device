import 'package:cbj_integrations_controller/integrations_controller.dart';

class SmartDeviceObjectsD {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }
}
