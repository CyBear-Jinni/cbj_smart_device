import 'package:cbj_smart_device/features/smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pb.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';

/// Button that contains light inside of it with one color and no opacity.
class ButtonWithLightObject extends ButtonObject {
  ButtonWithLightObject(
    String? id,
    String? deviceName,
    int? buttonPinInt,
    int? buttonLightInt, {
    Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
        buttonStatesAction,
  }) : super(
          id,
          deviceName,
          buttonPinInt,
          buttonStatesAction: buttonStatesAction,
        ) {
    buttonLight = DevicePinListManager().getGpioPin(buttonLightInt);

    buttonObjectRepository = ButtonObjectR();
    listenToButtonPress();
    print('Button with light object has been created');
  }

  ///  The type of the smart device, Light, blinds, button etc
  @override
  DeviceTypes? smartDeviceType = DeviceTypes.buttonWithLight;

  /// The light pin around the button.
  PinInformation? buttonLight;

  /// Will determine when to light the button light
  WhenToExecute whenToLightButtonLight = WhenToExecute.onOddNumberPress;

  /// Number of pins and the types needed
  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  static List<String> neededPinTypesList() => <String>['gpio', 'gpio'];

  /// Listen to the button press and execute actions from buttonStateActions
  @override
  Future<void> listenToButtonPress() async {
    if (buttonPin == null) {
      return;
    }

    String? wishExecuteResult;

    while (true) {
      await buttonObjectRepository!
          .listenToButtonPress(buttonPin!)
          .then((int exitCode) async {
        await executeOnButtonPress();
      });

      if (whenToLightButtonLight == WhenToExecute.onOddNumberPress &&
          pressStateCounter % 2 != 0) {
      } else if (whenToLightButtonLight == WhenToExecute.evenNumberPress &&
          pressStateCounter % 2 == 0) {
        wishExecuteResult = OnWishU.setOn(deviceInformation, buttonLight);
      } else {
        wishExecuteResult = OffWishU.setOff(deviceInformation, buttonLight);
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}
