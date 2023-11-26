import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_smart_device/core/device_information.dart';

///  Class to change wish on status to device
class SmartComputerWishU {
  ///  Suspend the computer
  static Future<String?> suspendComputer(
    DeviceInformation deviceInformation,
  ) {
    return SystemCommandsManager().suspendComputer();
    // return 'Response from this device suspend successful';
  }

  ///  Shut down the computer
  static Future<String?> shutdownComputer(
    DeviceInformation deviceInformation,
  ) {
    return SystemCommandsManager().shutdownComputer();
  }
}
