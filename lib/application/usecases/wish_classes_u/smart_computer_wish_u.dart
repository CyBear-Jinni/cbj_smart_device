import 'package:cbj_smart_device/core/device_information.dart';
import 'package:cbj_smart_device/infrastructure/repositories/core_r/my_singleton_helper.dart';

///  Class to change wish on status to device
class SmartComputerWishU {
  ///  Suspend the computer
  static String suspendComputer(
    DeviceInformation deviceInformation,
  ) {
    MySingletonHelper.suspendComputer();
    return 'Response from this device suspend successful';
  }

  ///  Shut down the computer
  static String shutdownComputer(
    DeviceInformation deviceInformation,
  ) {
    MySingletonHelper.shutdownComputer();
    return 'Response from this device shutdown successful';
  }
}
