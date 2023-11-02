import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBase {
  SmartDeviceSimpleAbstract(
    super.uuid,
    super.deviceName,
    super.onOffPinNumber, {
    super.onOffButtonPinNumber,
  });

  ///  How much time the smart device was active (Doing action) continuously
  double? howMuchTimeTheDeviceDoingAction;

  @override
  static List<String> neededPinTypesList() => [];

  @override
  Future<String> executeActionString(
    String cbjDeviceActionstring,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final CbjDeviceActions? deviceAction =
        convertWishStringToWishesObject(cbjDeviceActionstring);
    return executeDeviceAction(deviceAction!, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the simple class
  Future<String> wishInSimpleClass(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    if (deviceAction == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(deviceAction, deviceState);
  }
}
