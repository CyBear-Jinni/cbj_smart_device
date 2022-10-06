import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

///  Abstract class for devices with property of how much to move and without
///  how much time the device is doing action without stopping
abstract class SmartDeviceStaticAbstract extends SmartDeviceBase {
  SmartDeviceStaticAbstract(String? uuid, smartInstanceName, onOffPinNumber,
      {onOffButtonPinNumber})
      : super(uuid, smartInstanceName as String?, onOffPinNumber as int?,
            onOffButtonPinNumber: onOffButtonPinNumber as int?);

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
  void setDeviceType(DeviceTypes deviceType) => super.setDeviceType(deviceType);

  ///  All the wishes that are legit to execute from the static class
  @override
  Future<String> executeActionString(
      String wishString, DeviceStateGRPC deviceState) async {
    final wish = convertWishStringToWishesObject(wishString);
    print(wishString);
    print(wish.toString());
    if (wish == null) return 'Your wish does not exist on static class';
    return executeDeviceAction(wish, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    return wishInStaticClass(deviceAction, deviceState);
  }

  String wishInStaticClass(
      DeviceActions deviceAction, DeviceStateGRPC deviceState) {
    switch (deviceAction) {
      case DeviceActions.stop:
        return _HowMuchToMove();
      default:
        return wishInBaseClass(deviceAction, deviceState);
    }
  }
}
