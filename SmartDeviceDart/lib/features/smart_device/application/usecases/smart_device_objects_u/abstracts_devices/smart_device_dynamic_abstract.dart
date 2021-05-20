import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/dynamic_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

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
  Future<String> executeActionString(
      String wishString, WishSourceEnum wishSourceEnum) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString);
    if (deviceAction == null) return 'Your deviceAction does not exist on ';
    return executeDeviceAction(deviceAction, wishSourceEnum);
  }

  @override
  Future<String> executeDeviceAction(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) async {
    return _WishInDynamicClass(deviceAction, wishSourceEnum);
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
  String _WishInDynamicClass(
      DeviceActions deviceAction, WishSourceEnum wishSourceEnum) {
    switch (deviceAction) {
      case DeviceActions.ActionNotSupported:
        return _SetDynamicValue();
      case DeviceActions.ActionNotSupported:
        return _OpenDynamicValue();
      default:
        return wishInSimpleClass(deviceAction, wishSourceEnum);
    }
  }
}
