import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/set_devices_r/set_devices_r.dart';

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

    final List<DeviceType> deviceTypeList = [];

    for (final String deviceAsString in devicesSeparated) {
      deviceTypeList.add(EnumHelper.stringToDeviceType(deviceAsString));
    }

    if (deviceTypeList.isEmpty) {
      return null;
    }

    final List<SmartDeviceBaseAbstract> smartDeviceList =
        <SmartDeviceBaseAbstract>[];
    final String uuid = await getCurrentDeviceUUid();

    for (final DeviceType deviceType in deviceTypeList) {
      if (deviceType == DeviceType.Light) {
        final int lightPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceType.Light)[0]
            ?.pinAndPhysicalPinConfiguration;

        final int buttonPinNumber = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceType.Light)[1]
            ?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(smartDeviceList, DeviceType.Light);
        smartDeviceList.add(LightObject(
            uuid, 'Light$deviceTypeCounter', lightPinNumber,
            onOffButtonPinNumber: buttonPinNumber));
      } else if (deviceType == DeviceType.Blinds) {
        List<PinInformation> lightPinAndButtonPin = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceType.Light);

        final int blindUpPinNumber =
            lightPinAndButtonPin[0]?.pinAndPhysicalPinConfiguration;

        final int buttonUpPinNumber =
            lightPinAndButtonPin[1]?.pinAndPhysicalPinConfiguration;

        lightPinAndButtonPin = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceType.Light);

        final int blindDownPinNumber =
            lightPinAndButtonPin[0]?.pinAndPhysicalPinConfiguration;

        final int buttonDownPinNumber =
            lightPinAndButtonPin[1]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter =
            numberOfThatTypeThatExist(smartDeviceList, DeviceType.Blinds);
        smartDeviceList.add(BlindsObject(
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
            ));
      }
    }
    if (smartDeviceList.isEmpty) {
      return null;
    }
    return smartDeviceList;
  }

  /// Return the number of times this device type was already exist
  int numberOfThatTypeThatExist(
      List<SmartDeviceBaseAbstract> smartDeviceList, DeviceType deviceType) {
    int counterOfThisDeviceType = 0;
    for (final SmartDeviceBaseAbstract smartDevice in smartDeviceList) {
      if (smartDevice.getDeviceType() == deviceType) {
        counterOfThisDeviceType++;
      }
    }
    return counterOfThisDeviceType;
  }
}
