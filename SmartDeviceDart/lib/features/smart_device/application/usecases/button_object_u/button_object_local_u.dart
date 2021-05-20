import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

class ButtonObjectLocalU extends ButtonObjectLocalAbstract {
  ButtonObjectLocalU({this.cloudValueChangeU});

  CloudValueChangeU cloudValueChangeU;

  @override
  void buttonPressed(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation lightPin) async {
    int errorCounter = 0;

    try {
      while (true) {
        final int returnValue =
            await buttonObjectRepository.listenToButtonPress(buttonPinNumber);

        if (returnValue < 0) {
          errorCounter++;
          if (errorCounter > 10) {
            print('Stop the listening to the button, it failed more than '
                '$errorCounter times');
          }
          return;
        }

        if (lightPin.v == 1) {
          await smartDevice.executeDeviceAction(
              DeviceActions.Off, DeviceStateGRPC.waitingInComp);
        } else {
          await smartDevice.executeDeviceAction(
              DeviceActions.On, DeviceStateGRPC.waitingInComp);
        }

        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: $error');
    }
  }

  @override
  void buttonPressedForThermostat(SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber, PinInformation thermostat) async {
    int errorCounter = 0;

    try {
      while (true) {
        final int returnValue =
            await buttonObjectRepository.listenToButtonPress(buttonPinNumber);

        if (returnValue < 0) {
          errorCounter++;
          if (errorCounter > 10) {
            print('Stop the listening to the button, it failed more than '
                '$errorCounter times');
          }
          return;
        }

        if (thermostat.v == 1) {
          await smartDevice.executeDeviceAction(
              DeviceActions.ActionNotSupported, DeviceStateGRPC.waitingInComp);
        } else {
          await smartDevice.executeDeviceAction(
              DeviceActions.ActionNotSupported, DeviceStateGRPC.waitingInComp);
        }

        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: $error');
    }
  }

  ///  Listen to two buttons but work only if one is pressed.
  @override
  Future<void> listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstButtonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondButtonPinNumber,
      PinInformation secondLightPin) async {
    listenToButtonPressAndCangeBlindStateAccordingly(
        smartDevice, firstButtonPinNumber, firstLightPin, secondLightPin, 1);

    listenToButtonPressAndCangeBlindStateAccordingly(
        smartDevice, secondButtonPinNumber, firstLightPin, secondLightPin, 2);
  }

  @override
  void listenToButtonPressAndCangeBlindStateAccordingly(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation buttonPinNumber,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonNumber) async {
    while (true) {
      await buttonObjectRepository
          .listenToButtonPress(buttonPinNumber)
          .then((int exitCode) async {
        print('Blind button number $buttonNumber was pressed');
        final DeviceActions blindNewAction = await changePinsOutput(
            smartDevice, firstLightPin, secondLightPin, buttonNumber);
        updateCloudValue(smartDevice.id, blindNewAction);
      });
    }
  }

  void updateCloudValue(String blindName, DeviceActions action) {
    final String wishAsString = EnumHelper.deviceActionToString(action);
    cloudValueChangeU ??= CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      cloudValueChangeU.updateDocument(blindName, wishAsString);
    }
  }

  ///  Logic of two buttons that cannot be pressed together
  @override
  Future<DeviceActions> changePinsOutput(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonPressNumber) async {
    DeviceActions blindNewAction;
    if (firstLightPin.v == 1 || secondLightPin.v == 1) {
      firstLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);
      blindNewAction = DeviceActions.Stop;
    } else if (buttonPressNumber == 1) {
      secondLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);

      firstLightPin.onDuration = -1;
      OnWishU.setOn(smartDevice.deviceInformation, firstLightPin);
      blindNewAction = DeviceActions.MoveUP;
    } else if (buttonPressNumber == 2) {
      firstLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = -1;
      OnWishU.setOn(smartDevice.deviceInformation, secondLightPin);
      blindNewAction = DeviceActions.MoveDon;
    }

    await Future.delayed(const Duration(seconds: 1));
    return blindNewAction;
  }
}
