import 'package:cbj_smart_device/features/smart_device/application/usecases/button_object_u/button_with_light_object.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/device_pin_manager.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/repositories/set_devices_r/set_devices_r.dart';
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
      String textOfSmartDevices,) async {
    final List<String> devicesSeparated = textOfSmartDevices
        .replaceAll(' ', '')
        .replaceFirst('\n', '')
        .split(',');
    if (devicesSeparated.last == '') {
      devicesSeparated.removeLast();
    }
    print(devicesSeparated);

    final List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractList = [];

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

        final int deviceTypeCounter = numberOfThatTypeThatExist(
            smartDeviceBaseAbstractList, DeviceTypes.light,);

        smartDeviceBaseAbstractList.add(LightObject(
          uuid,
          'Light$deviceTypeCounter',
          lightPinNumber,
        )..id = id,);
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

        final int deviceTypeCounter = numberOfThatTypeThatExist(
            smartDeviceBaseAbstractList, DeviceTypes.boiler,);

        smartDeviceBaseAbstractList.add(BoilerObject(
            uuid, 'Boiler$deviceTypeCounter', boilerPinNumber, buttonPinNumber,)
          ..id = id,);
      }

      /// Setting up for Blinds
      else if (deviceType == DeviceTypes.blinds) {
        final List<PinInformation?>? blindPinsAndButtonPins =
            DevicePinListManager()
                .getFreePinsForSmartDeviceType(DeviceTypes.blinds);

        final int? blindUpPinNumber =
            blindPinsAndButtonPins?[0]?.pinAndPhysicalPinConfiguration;

        final int? buttonUpPinNumber =
            blindPinsAndButtonPins?[1]?.pinAndPhysicalPinConfiguration;

        final int? blindDownPinNumber =
            blindPinsAndButtonPins?[2]?.pinAndPhysicalPinConfiguration;

        final int? buttonDownPinNumber =
            blindPinsAndButtonPins?[3]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
            smartDeviceBaseAbstractList, DeviceTypes.blinds,);

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
              )
            ..id = id,
        );
      }

      /// Setting up simple Button
      else if (deviceType == DeviceTypes.button) {
        final List<PinInformation?>? buttonPinList = DevicePinListManager()
            .getFreePinsForSmartDeviceType(DeviceTypes.button);

        final int? buttonPin =
            buttonPinList?[0]?.pinAndPhysicalPinConfiguration;

        final int deviceTypeCounter = numberOfThatTypeThatExist(
            smartDeviceBaseAbstractList, DeviceTypes.button,);

        final Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
            buttonStatesAction =
            ButtonObject.buttonDefaultStateAction(smartDeviceBaseAbstractList);

        smartDeviceBaseAbstractList.add(ButtonObject(
            uuid, 'Button $deviceTypeCounter', buttonPin,
            buttonStatesAction: buttonStatesAction,),);
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

        final int deviceTypeCounter = numberOfThatTypeThatExist(
            smartDeviceBaseAbstractList, DeviceTypes.buttonWithLight,);

        final Map<WhenToExecute, Map<SmartDeviceBase, List<DeviceActions>>>?
            buttonStatesAction =
            ButtonObject.buttonDefaultStateAction(smartDeviceBaseAbstractList);

        smartDeviceBaseAbstractList.add(ButtonWithLightObject(uuid,
            'Button With Light $deviceTypeCounter', buttonPin, buttonLightPin,
            buttonStatesAction: buttonStatesAction,),);
      }
    }
    if (smartDeviceBaseAbstractList.isEmpty) {
      return [];
    }
    return smartDeviceBaseAbstractList;
  }

  /// Return the number of times this device type was already exist
  int numberOfThatTypeThatExist(
      List<dynamic> smartDeviceList, DeviceTypes deviceType,) {
    int counterOfThisDeviceType = 0;
    for (final dynamic smartDevice in smartDeviceList) {
      if (smartDevice.getDeviceType() == deviceType) {
        counterOfThisDeviceType++;
      }
    }
    return counterOfThisDeviceType;
  }
}
