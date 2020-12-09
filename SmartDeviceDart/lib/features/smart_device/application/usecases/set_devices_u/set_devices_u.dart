import 'package:smart_device_dart/core/my_singleton.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/set_devices_e/set_devices_e.dart';

/// This class will load all saved smart devices objects from file at startup into the program
class SetDevicesU {
//  TODO: Pull the saved devices into the app variables

  SetDevicesU() {
    _setDevicesE = SetDevicesE();
  }

  SetDevicesE _setDevicesE;

  ///  Setting all the devices from saved data
  void setAllDevices({List<SmartDeviceBaseAbstract> deviceList}) async {
    if (deviceList != null) {
      MySingleton.setSmartDevicesList(deviceList);
    } else {
      String deviceConfiguration = await _setDevicesE.getDeviceDefaultConfig();
      if (deviceConfiguration == null || deviceConfiguration.isEmpty) {
        print('\nDefault configuration file content is null or empty !!!.\n'
            'Please add configuration file with device type to it,'
            ' for example\nLight, \nand try again.');

        return;
      }
      List<SmartDeviceBaseAbstract> listOfSmartDevices =
          await _setDevicesE.convertToListOfDevices(deviceConfiguration);
      if (listOfSmartDevices.isNotEmpty) {
        MySingleton.setSmartDevicesList(listOfSmartDevices);
      }
      print(listOfSmartDevices);
    }
//      manualSetup();
  }

  Future<void> manualSetup() async {
    final String uuid = await _setDevicesE.getCurrentDeviceUUid();

    MySingleton.setSmartDevicesList(<SmartDeviceBaseAbstract>[
      LightObject(uuid, 'Stairs', 8, onOffButtonPinNumber: 10),
      LightObject(uuid, 'Storage', 12, onOffButtonPinNumber: 14)

//        LightObject('30:23:a2:G3:34', 'Guy ceiling light', 11,
//            onOffButtonPinNumber:
//                2)); // NanoPi Duo2 will be pin 16 for the button

//        .add(BlindsObject(
//        "30:23:a2:G3:34",
//        "Guy ceiling light",
//        null,
//        //  onOffPinNumber
//        null,
//        //  onOffButtonPinNumber
//        8,
//        //  blindsUpPin
//        10,
//        //  upButtonPinNumber
//        12,
//        //  blindsDownPin
//        14 // downButtonPinNumber
//    )); // NanoPi Duo2
    ]);
  }
}
