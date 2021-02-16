import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/dynamic_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';

import 'smart_device_simple_abstract.dart';

//  Abstract class for smart devices class with dynamic property
abstract class SmartDeviceDynamicAbstract extends SmartDeviceSimpleAbstract {
  SmartDeviceDynamicAbstract(
      String uuid, String smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  ///  Save how much power to do for action
  double dynamicValue;

  @override
  Future<String> executeWishString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    final WishEnum wish = convertWishStringToWishesObject(wishString);
    if (wish == null) return 'Your wish does not exist on ';
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(
      WishEnum wishEnum, WishSourceEnum wishSourceEnum) async {
    return _WishInDynamicClass(wishEnum, wishSourceEnum);
  }

  ///  Set dynamic value
  String _SetDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant set dynamic value';
    }
    return DynamicWishU.setDynamic(deviceInformation);
  }

  ///  Change dynamic value with open connection
  String _OpenDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant create open connection with dynamic';
    }
    DynamicWishU.openDynamic(deviceInformation);
    onOff = false;
    return 'Turn on successfully';
  }

  ///  All the wishes that are legit to execute from the dynamic class
  String _WishInDynamicClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    switch (wish) {
      case WishEnum.SDynamic:
        return _SetDynamicValue();
      case WishEnum.ODynamic:
        return _OpenDynamicValue();
      default:
        return wishInSimpleClass(wish, wishSourceEnum);
    }
  }
}
