import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/dynamic_wish_u.dart';

//  Abstract class for smart devices class with dynamic property
abstract class SmartDeviceDynamicAbstract extends SmartDeviceSimpleAbstract {
  SmartDeviceDynamicAbstract(
    String super.uuid,
    String super.smartInstanceName,
    int super.onOffPinNumber, {
    super.onOffButtonPinNumber,
  });

  ///  Save how much power to do for action
  double? dynamicValue;

  @override
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final CbjDeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    if (deviceAction == null) return 'Your deviceAction does not exist on ';
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return _wishInDynamicClass(deviceAction, deviceState);
  }

  ///  Set dynamic value
  String _setDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant set dynamic value';
    }
    return DynamicWishU.setDynamic(deviceInformation);
  }

  ///  Change dynamic value with open connection
  String _openDynamicValue() {
    if (deviceInformation == null) {
      return 'Device information is missing, cant create open connection with dynamic';
    }
    DynamicWishU.openDynamic(deviceInformation);
    onOff = false;
    return 'Turn on successfully';
  }

  ///  All the wishes that are legit to execute from the dynamic class
  Future<String> _wishInDynamicClass(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    switch (deviceAction) {
      case CbjDeviceActions.actionNotSupported:
        return _setDynamicValue();
      default:
        return wishInSimpleClass(deviceAction, deviceState);
    }
  }
}
