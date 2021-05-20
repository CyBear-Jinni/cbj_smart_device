import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

import 'smart_device_base_abstract.dart';

///  Abstract class for devices with property of how much to move and without how much time the device is doing action without stopping
abstract class SmartDeviceStaticAbstract extends SmartDeviceBaseAbstract {
  SmartDeviceStaticAbstract(uuid, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber})
      : super(smartInstanceName as String, onOffPinNumber as int,
            onOffButtonPinNumber: onOffButtonPinNumber as int);

  //  TODO: set how much to move
  String _HowMuchToMove() {
    return 'How much to move not supported yet';
//    if(deviceInformation == null) {
//      return "Device information is missing, cant trun off";
//    }
//    DynamicWish.OpenDynamic(deviceInformation);
//    onOff = false;
//    return 'Turn on sucsessfuly';
  }

  @override
  void setDeviceType(DeviceType deviceType) => super.setDeviceType(deviceType);

  ///  All the wishes that are legit to execute from the static class
  @override
  Future<String> executeActionString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    var wish = convertWishStringToWishesObject(wishString);
    print(wishString);
    print(wish.toString());
    if (wish == null) return 'Your wish does not exist on static class';
    return executeDeviceAction(wish, wishSourceEnum);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) async {
    return wishInStaticClass(deviceAction, wishSourceEnum);
  }

  String wishInStaticClass(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) {
    switch (deviceAction) {
      case DeviceActions.Stop:
        return _HowMuchToMove();
      default:
        return wishInBaseClass(deviceAction, wishSourceEnum);
    }
  }
}
