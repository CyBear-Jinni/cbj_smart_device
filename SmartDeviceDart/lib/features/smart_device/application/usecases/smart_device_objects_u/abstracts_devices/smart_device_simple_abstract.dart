import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';

import 'smart_device_base_abstract.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  SmartDeviceSimpleAbstract(
      String uuid, String smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  ///  How much time the smart device was active (Doing action) continuously
  double howMuchTimeTheDeviceDoingAction;

  @override
  void setDeviceType(DeviceType deviceType) => super.setDeviceType(deviceType);

  @override
  Future<String> executeWishString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    WishEnum wish = convertWishStringToWishesObject(wishString);
    return executeWish(wish, wishSourceEnum);
  }

  @override
  Future<String> executeWish(WishEnum wishEnum,
      WishSourceEnum wishSourceEnum) async {
    return wishInSimpleClass(wishEnum, wishSourceEnum);
  }

  ///  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(WishEnum wish, WishSourceEnum wishSourceEnum) {
    if (wish == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(wish, wishSourceEnum);
  }
}
