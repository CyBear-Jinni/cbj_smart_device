import 'package:smart_device_dart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';

// This class Preform most of the request
class ActionsToPreformU {
  static Future<String> executeWishEnum(SmartDeviceBaseAbstract smartDevice,
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) async {
    var deviceStatus = await smartDevice.executeWish(wishEnum, wishSourceEnum);
    print('Device state is $deviceStatus');

    CloudValueChangeU cloudValueChangeU =
        CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      if (deviceStatus == 'Turn on successfully' ||
          deviceStatus == 'Turn off successfully' ||
          deviceStatus == 'Cant turn on this pin: null Number' ||
          deviceStatus == 'Cant turn off this pin: null Number') {
        cloudValueChangeU.updateDeviceDocument(smartDevice.id, 'state', 'ack');
      } else {
        cloudValueChangeU.updateDeviceDocument(
            smartDevice.id, 'stateMassage', deviceStatus);
      }
    }
    return deviceStatus;
  }
}
