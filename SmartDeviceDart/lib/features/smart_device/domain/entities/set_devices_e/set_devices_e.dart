import 'package:smart_device_dart/features/smart_device/application/usecases/button_object_u/button_with_light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/set_devices_r/set_devices_r.dart';
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
      String textOfSmartDevices) async {
    final List<String> devicesSeparated = textOfSmartDevices
        .replaceAll(' ', '')
        .replaceFirst('\n', '')
        .split(',');
    if (devicesSeparated.last == '') {
      devicesSeparated.removeLast();
    }
    print(devicesSeparated);

    final List<dynamic> deviceList = <dynamic>[];
    final List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractList = [];
    final List<dynamic> buttonsList = [];

    final List<DeviceTypes> deviceTypeList = [];

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
    for (final DeviceTypes deviceType in deviceTypeList) {
      id = const Uuid().v1();

      /// Setting up for Light
      if (deviceType == DeviceTypes.light) {
        final List<PinInformation?>? lightPins = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.light);

        final int? lightPinNumber =
            lightPins?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonPinNumber =
            lightPins?[1]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(deviceList, DeviceTypes.light);
        deviceList.add(LightObject(
            uuid, 'Light$deviceTypeCounter', lightPinNumber,
            onOffButtonPinNumber: buttonPinNumber)
          ..id = id);
        smartDeviceBaseAbstractList
            .add(deviceList.last as SmartDeviceBaseAbstract);
      }

      /// Setting up for Boiler
      else if (deviceType == DeviceTypes.boiler) {
        final List<PinInformation?>? boilerPins = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.boiler);

        final int? boilerPinNumber =
            boilerPins?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonPinNumber =
            boilerPins?[1]?.pinAndPhysicalPinConfiguration;

        print('boilerPinNumber: $boilerPinNumber');
        print('buttonPinNumber: $buttonPinNumber');

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(deviceList, DeviceTypes.boiler);
        deviceList.add(BoilerObject(
            uuid, 'Boiler$deviceTypeCounter', boilerPinNumber, buttonPinNumber)
          ..id = id);
        smartDeviceBaseAbstractList
            .add(deviceList.last as SmartDeviceBaseAbstract);
      }

      /// Setting up for Blinds
      else if (deviceType == DeviceTypes.blinds) {
        final List<PinInformation?>? lightPinAndButtonPin =
            DevicePinListManager()
                .getFreePinsForSmartDeviceType(DeviceTypes.blinds);

        final int? blindUpPinNumber =
            lightPinAndButtonPin?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonUpPinNumber =
            lightPinAndButtonPin?[1]?.pinAndPhysicalPinConfiguration;

        final int? blindDownPinNumber =
            lightPinAndButtonPin?[2]?.pinAndPhysicalPinConfiguration;

        final int? buttonDownPinNumber =
            lightPinAndButtonPin?[3]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(deviceList, DeviceTypes.blinds);
        deviceList.add(
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
              buttonDownPinNumber // downButtonPinNumber
              )
            ..id = id,
        );
      }

      /// Setting up Button With Light
      else if (deviceType == DeviceTypes.buttonWithLight) {
        final List<PinInformation?>? lightPinAndButtonPin =
            DevicePinListManager()
                .getFreePinsForSmartDeviceType(DeviceTypes.buttonWithLight);

        final int? buttonPin =
            lightPinAndButtonPin?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonLightPin =
            lightPinAndButtonPin?[1]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(deviceList, DeviceTypes.blinds);

        Map<WhenToExecute, Map<SmartDeviceBaseAbstract, List<DeviceActions>>>?
            buttonStatesAction;

        if (smartDeviceBaseAbstractList.last.smartDeviceType ==
            DeviceTypes.light) {
          buttonStatesAction = {
            WhenToExecute.onOddNumberPress: {
              smartDeviceBaseAbstractList.last: [DeviceActions.on]
            },
            WhenToExecute.evenNumberPress: {
              smartDeviceBaseAbstractList.last: [DeviceActions.off]
            },
          };
        } else {
          print('Button with light will not work, last object does not'
              ' support this type');
        }

        deviceList.add(ButtonWithLightObject(buttonPin, buttonLightPin,
            buttonStatesAction: buttonStatesAction));

        buttonsList.add(deviceList.last);
      }
    }
    if (deviceList.isEmpty) {
      return [];
    }
    return smartDeviceBaseAbstractList;
  }

  /// Return the number of times this device type was already exist
  int numberOfThatTypeThatExist(
      List<dynamic> smartDeviceList, DeviceTypes deviceType) {
    int counterOfThisDeviceType = 0;
    for (final dynamic smartDevice in smartDeviceList) {
      if (smartDevice.getDeviceType() == deviceType) {
        counterOfThisDeviceType++;
      }
    }
    return counterOfThisDeviceType;
  }
}
