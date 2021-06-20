import 'package:smart_device_dart/core/my_singleton.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pb.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';

/// Simple button, without light inside.
class ButtonObject extends SmartDeviceBaseAbstract {
  ButtonObject(String? id, String? deviceName, int? buttonPinInt,
      {this.buttonStatesAction})
      : super(id, deviceName) {
    buttonPin = DevicePinListManager().getGpioPin(buttonPinInt);

    buttonObjectRepository = ButtonObjectR();
    listenToButtonPress();
    print('Button object has been created');
  }

  ///  The type of the smart device, Light, blinds, button etc
  @override
  DeviceTypes? smartDeviceType = DeviceTypes.button;

  /// The button will save list of states like on, off, long press, double tap.
  /// For each button press state we save the smart object and the actions that
  /// we want to preform on it.
  Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
      buttonStatesAction;

  /// Button pin information to listen to.
  PinInformation? buttonPin;

  /// First press of the button or the second one
  int pressStateCounter = 0;

  /// Save current state of button press
  WhenToExecute currentButtonPressState = WhenToExecute.undefined;

  /// Class to interact with simple button.
  ButtonObjectR? buttonObjectRepository;

  /// Number of pins and the types needed
  @override
  List<String> getNeededPinTypesList() => <String>['gpio'];

  @override
  static List<String> neededPinTypesList() => <String>['gpio'];

  /// Listen to the button press and execute actions from buttonStateActions
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
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  /// Execute on button press
  Future<String> executeOnButtonPress() async {
    print(
        'Button number ${buttonPin?.pinAndPhysicalPinConfiguration.toString()}'
        ' was pressed');
    pressStateCounter++;
    if (pressStateCounter > 2) {
      pressStateCounter = 1;
    }

    if (pressStateCounter % 2 != 0) {
      currentButtonPressState = WhenToExecute.onOddNumberPress;
    } else {
      currentButtonPressState = WhenToExecute.evenNumberPress;
    }

    buttonStatesAction?.forEach((whenToExecute, smartDeviceAndActionsMap) {
      if (whenToExecute == currentButtonPressState) {
        if (whenToExecute == WhenToExecute.onOddNumberPress ||
            whenToExecute == WhenToExecute.evenNumberPress) {
          smartDeviceAndActionsMap.forEach((smartDevice, actionsToExecute) {
            actionsToExecute.forEach((DeviceActions action) async {
              print('${smartDevice.deviceName} is now going to execute '
                  '"${actionsToExecute.toString()}" action');
              await smartDevice.executeDeviceAction(
                  action, DeviceStateGRPC.waitingInComp);
            });
          });
        }
      }
    });

    return '';
  }

  static Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
      buttonDefaultStateAction(
          List<SmartDeviceBaseAbstract>? smartDeviceBaseAbstractList) {
    Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
        buttonStatesAction;

    List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractListTemp;

    if (smartDeviceBaseAbstractList != null) {
      smartDeviceBaseAbstractListTemp = smartDeviceBaseAbstractList;
    } else {
      smartDeviceBaseAbstractListTemp = MySingleton.getSmartDevicesList();
    }
    if (smartDeviceBaseAbstractListTemp.last.smartDeviceType ==
        DeviceTypes.light) {
      if (smartDeviceBaseAbstractListTemp.last is SmartDeviceBase) {
        final SmartDeviceBase smartDeviceBaseTemp =
            smartDeviceBaseAbstractListTemp.last as SmartDeviceBase;
        buttonStatesAction = {
          WhenToExecute.onOddNumberPress: {
            smartDeviceBaseTemp: [DeviceActions.on]
          },
          WhenToExecute.evenNumberPress: {
            smartDeviceBaseTemp: [DeviceActions.off]
          },
        };
      }
    } else {
      print('Button with light will not work, last object does not'
          ' support this type');
    }
    return buttonStatesAction;
  }
}
