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

  SetDevicesR _setDevicesR;

  Future<String> getCurrentDeviceUUid() {
    return _setDevicesR.getCurrentDeviceUUid();
  }

  Future<String> getDeviceDefaultConfig() {
    return _setDevicesR.getDeviceDefaultConfig();
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

    final List<DeviceTypes> deviceTypeList = [];

    for (final String deviceAsString in devicesSeparated) {
      deviceTypeList.add(EnumHelper.stringToDeviceType(deviceAsString));
    }

    if (deviceTypeList.isEmpty) {
      return [];
    }

    final List<SmartDeviceBaseAbstract> smartDeviceList =
        <SmartDeviceBaseAbstract>[];

    String uuid;

    try {
      uuid = await getCurrentDeviceUUid();
    } catch (e) {
      print("Can't get uuid: $e");
    }

    String id;
    for (final DeviceTypes deviceType in deviceTypeList) {
      id = Uuid().v1();

      /// Setting up for Light
      if (deviceType == DeviceTypes.light) {
        final int lightPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.light)[0]
            ?.pinAndPhysicalPinConfiguration;

        final int buttonPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.light)[1]
            ?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(smartDeviceList, DeviceTypes.light);
        smartDeviceList.add(LightObject(
            uuid, 'Light$deviceTypeCounter', lightPinNumber,
            onOffButtonPinNumber: buttonPinNumber)
          ..id = id);
      }

      /// Setting up for Boiler
      else if (deviceType == DeviceTypes.boiler) {
        final int boilerPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.light)[0]
            ?.pinAndPhysicalPinConfiguration;

        final int buttonPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.light)[1]
            ?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(smartDeviceList, DeviceTypes.boiler);
        smartDeviceList.add(BoilerObject(
            uuid, 'Boiler$deviceTypeCounter', null, null, boilerPinNumber,
            boilerButtonPinNumber: buttonPinNumber)
          ..id = id);
      }

      /// Setting up for Blinds
      else if (deviceType == DeviceTypes.blinds) {
        final List<PinInformation> lightPinAndButtonPin = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.blinds);

        final int blindUpPinNumber =
            lightPinAndButtonPin[0]?.pinAndPhysicalPinConfiguration;

        final int buttonUpPinNumber =
            lightPinAndButtonPin[1]?.pinAndPhysicalPinConfiguration;

        final int blindDownPinNumber =
            lightPinAndButtonPin[2]?.pinAndPhysicalPinConfiguration;

        final int buttonDownPinNumber =
            lightPinAndButtonPin[3]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(smartDeviceList, DeviceTypes.blinds);
        smartDeviceList.add(
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
    }
    if (smartDeviceList.isEmpty) {
      return [];
    }
    return smartDeviceList;
  }

  /// Return the number of times this device type was already exist
  int numberOfThatTypeThatExist(
      List<SmartDeviceBaseAbstract> smartDeviceList, DeviceTypes deviceType) {
    int counterOfThisDeviceType = 0;
    for (final SmartDeviceBaseAbstract smartDevice in smartDeviceList) {
      if (smartDevice.getDeviceType() == deviceType) {
        counterOfThisDeviceType++;
      }
    }
    return counterOfThisDeviceType;
  }
}
