import 'package:cbj_smart_device/application/usecases/button_object_u/button_with_light_object.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/domain/entities/core_e/enums_e.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_smart_device/infrastructure/repositories/set_devices_r/set_devices_r.dart';
import 'package:uuid/uuid.dart';

class SetDevicesE {
  SetDevicesE() {
    _setDevicesR = SetDevicesR();
  }

  SetDevicesR? _setDevicesR;

  Future<String> getCurrentDeviceUUid() {
    return _setDevicesR!.getCurrentDeviceUUid();
  }

  Future<String?> getDeviceDefaultConfig() {
    return _setDevicesR!.getDeviceDefaultConfig();
  }

  Future<List<SmartDeviceBaseAbstract>> convertToListOfDevices(
    String textOfSmartDevices,
  ) async {
    final List<String> devicesSeparated = textOfSmartDevices
        .replaceAll(' ', '')
        .replaceFirst('\n', '')
        .split(',');
    if (devicesSeparated.last == '') {
      devicesSeparated.removeLast();
    }
    print(devicesSeparated);

    final List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractList = [];

    final List<CbjDeviceTypes> deviceTypeList = [];

    for (final String deviceAsString in devicesSeparated) {
      deviceTypeList.add(EnumHelper.stringToDeviceType(deviceAsString)!);
    }

    if (deviceTypeList.isEmpty) {
      return [];
    }

    String? uuid;

    try {
      uuid = await getCurrentDeviceUUid();
    } catch (e) {
      print("Can't get uuid: $e");
    }

    String id;
    for (final CbjDeviceTypes deviceType in deviceTypeList) {
      id = const Uuid().v1();

      /// Setting up for Light
      if (deviceType == CbjDeviceTypes.light) {
        final List<PinInformation?>? lightPins = DevicePinListManager()
            .getFreePinsForSmartDeviceType(CbjDeviceTypes.light);

        final int? lightPinNumber =
            lightPins?[0]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
          smartDeviceBaseAbstractList,
          CbjDeviceTypes.light,
        );

        smartDeviceBaseAbstractList.add(
          LightObject(
            uuid,
            'Light$deviceTypeCounter',
            lightPinNumber,
          )..id = id,
        );
      }

      /// Setting up for Boiler
      else if (deviceType == CbjDeviceTypes.boiler) {
        final List<PinInformation?>? boilerPins = DevicePinListManager()
            .getFreePinsForSmartDeviceType(CbjDeviceTypes.boiler);

        final int? boilerPinNumber =
            boilerPins?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonPinNumber =
            boilerPins?[1]?.pinAndPhysicalPinConfiguration;

        print('boilerPinNumber: $boilerPinNumber');
        print('buttonPinNumber: $buttonPinNumber');

        final int deviceTypeCounter = numberOfThatTypeThatExist(
          smartDeviceBaseAbstractList,
          CbjDeviceTypes.boiler,
        );

        smartDeviceBaseAbstractList.add(
          BoilerObject(
            uuid,
            'Boiler$deviceTypeCounter',
            boilerPinNumber,
            buttonPinNumber,
          )..id = id,
        );
      }

      /// Setting up for Blinds
      else if (deviceType == CbjDeviceTypes.blinds) {
        final List<PinInformation?>? blindPinsAndButtonPins =
            DevicePinListManager()
                .getFreePinsForSmartDeviceType(CbjDeviceTypes.blinds);

        final int? blindUpPinNumber =
            blindPinsAndButtonPins?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonUpPinNumber =
            blindPinsAndButtonPins?[1]?.pinAndPhysicalPinConfiguration;

        final int? blindDownPinNumber =
            blindPinsAndButtonPins?[2]?.pinAndPhysicalPinConfiguration;

        final int? buttonDownPinNumber =
            blindPinsAndButtonPins?[3]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
          smartDeviceBaseAbstractList,
          CbjDeviceTypes.blinds,
        );

        smartDeviceBaseAbstractList.add(
          BlindsObject(
            uuid,
            'Blinds$deviceTypeCounter',
            null,
            //  onOffPinNumber
            null,
            //  onOffButtonPinNumber
            blindUpPinNumber,
            //  blindsUpPin
            buttonUpPinNumber,
            //  upButtonPinNumber
            blindDownPinNumber,
            //  blindsDownPin
            buttonDownPinNumber, // downButtonPinNumber
          )..id = id,
        );
      }

      /// Setting up simple Button
      else if (deviceType == CbjDeviceTypes.button) {
        final List<PinInformation?>? buttonPinList = DevicePinListManager()
            .getFreePinsForSmartDeviceType(CbjDeviceTypes.button);

        final int? buttonPin =
            buttonPinList?[0]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
          smartDeviceBaseAbstractList,
          CbjDeviceTypes.button,
        );

        final Map<CbjWhenToExecute,
                Map<SmartDeviceBase, List<CbjDeviceActions>>>?
            buttonStatesAction =
            ButtonObject.buttonDefaultStateAction(smartDeviceBaseAbstractList);

        smartDeviceBaseAbstractList.add(
          ButtonObject(
            uuid,
            'Button $deviceTypeCounter',
            buttonPin,
            buttonStatesAction: buttonStatesAction,
          ),
        );
      }

      /// Setting up Button With Light
      else if (deviceType == CbjDeviceTypes.buttonWithLight) {
        final List<PinInformation?>? lightPinAndButtonPin =
            DevicePinListManager()
                .getFreePinsForSmartDeviceType(CbjDeviceTypes.buttonWithLight);

        final int? buttonPin =
            lightPinAndButtonPin?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonLightPin =
            lightPinAndButtonPin?[1]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
          smartDeviceBaseAbstractList,
          CbjDeviceTypes.buttonWithLight,
        );

        final Map<CbjWhenToExecute,
                Map<SmartDeviceBase, List<CbjDeviceActions>>>?
            buttonStatesAction =
            ButtonObject.buttonDefaultStateAction(smartDeviceBaseAbstractList);

        smartDeviceBaseAbstractList.add(
          ButtonWithLightObject(
            uuid,
            'Button With Light $deviceTypeCounter',
            buttonPin,
            buttonLightPin,
            buttonStatesAction: buttonStatesAction,
          ),
        );
      }
    }
    if (smartDeviceBaseAbstractList.isEmpty) {
      return [];
    }
    return smartDeviceBaseAbstractList;
  }

  /// Return the number of times this device type was already exist
  int numberOfThatTypeThatExist(
    List<dynamic> smartDeviceList,
    CbjDeviceTypes deviceType,
  ) {
    int counterOfThisDeviceType = 0;
    for (final dynamic smartDevice in smartDeviceList) {
      if (smartDevice.getDeviceType() == deviceType) {
        counterOfThisDeviceType++;
      }
    }
    return counterOfThisDeviceType;
  }
}
