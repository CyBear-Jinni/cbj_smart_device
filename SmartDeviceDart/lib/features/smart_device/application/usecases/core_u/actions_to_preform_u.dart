import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';

class ActionsToPreformU {
  static Future<String> executeWishEnum(SmartDeviceBaseAbstract smartDevice,
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) async {
    final deviceStatus =
        await smartDevice.executeWish(wishEnum, wishSourceEnum);
    return deviceStatus;
  }
}
