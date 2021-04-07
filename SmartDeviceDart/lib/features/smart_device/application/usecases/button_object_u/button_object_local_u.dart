import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_object_local_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';

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
            print(
                'Stop the listening to the button, it failed more than $errorCounter times');
          }
          return;
        }

        if (lightPin.v == 1) {
          await smartDevice.executeWish(
              WishEnum.SOff, WishSourceEnum.ButtonPress);
        } else {
          await smartDevice.executeWish(
              WishEnum.SOn, WishSourceEnum.ButtonPress);
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
    listenToButtonPressAndDoAction(
        smartDevice, firstButtonPinNumber, firstLightPin, secondLightPin, 1);

    listenToButtonPressAndDoAction(
        smartDevice, secondButtonPinNumber, firstLightPin, secondLightPin, 2);
  }

  @override
  void listenToButtonPressAndDoAction(
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
        final WishEnum blindNewState = await changePinsOutput(
            smartDevice, firstLightPin, secondLightPin, buttonNumber);
        updateCloudValue(smartDevice.id, blindNewState);
      });
    }
  }

  void updateCloudValue(String blindName, WishEnum wish) {
    final String wishAsString = EnumHelper.wishEnumToString(wish);
    cloudValueChangeU ??= CloudValueChangeU.getCloudValueChangeU();
    if (cloudValueChangeU != null) {
      cloudValueChangeU.updateDocument(blindName, wishAsString);
    }
  }

  ///  Logic of two buttons that cannot be pressed together
  @override
  Future<WishEnum> changePinsOutput(
      SmartDeviceBaseAbstract smartDevice,
      PinInformation firstLightPin,
      PinInformation secondLightPin,
      int buttonPressNumber) async {
    WishEnum blindNewState;
    if (firstLightPin.v == 1 || secondLightPin.v == 1) {
      firstLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);
      blindNewState = WishEnum.SBlindsStop;
    } else if (buttonPressNumber == 1) {
      secondLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, secondLightPin);

      firstLightPin.onDuration = -1;
      OnWishU.setOn(smartDevice.deviceInformation, firstLightPin);
      blindNewState = WishEnum.SBlindsUp;
    } else if (buttonPressNumber == 2) {
      firstLightPin.onDuration = 0;
      OffWishU.setOff(smartDevice.deviceInformation, firstLightPin);

      secondLightPin.onDuration = -1;
      OnWishU.setOn(smartDevice.deviceInformation, secondLightPin);
      blindNewState = WishEnum.SBlindsDown;
    }

    await Future.delayed(const Duration(seconds: 1));
    return blindNewState;
  }
}
