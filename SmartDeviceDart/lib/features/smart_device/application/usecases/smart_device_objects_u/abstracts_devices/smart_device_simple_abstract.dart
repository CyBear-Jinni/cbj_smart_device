import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

import 'smart_device_base_abstract.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBaseAbstract {
  SmartDeviceSimpleAbstract(
      String uuid, String smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber})
      : super(smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);

  ///  How much time the smart device was active (Doing action) continuously
  double howMuchTimeTheDeviceDoingAction;

  @override
  void setDeviceType(DeviceType deviceType) => super.setDeviceType(deviceType);

  @override
  Future<String> executeActionString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString);
    return executeDeviceAction(deviceAction, wishSourceEnum);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) async {
    return wishInSimpleClass(deviceAction, wishSourceEnum);
  }

  ///  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) {
    if (deviceAction == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(deviceAction, wishSourceEnum);
  }
}
