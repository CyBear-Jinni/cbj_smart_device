import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';

// enum DeviceType {
//   Light, //  Light ON/OFF
//   DynamicLight, //  Light with brightness 0% to 100%
//   Blinds,
//   Boiler,
//   Fan,
//   AirConditioner,
//   Camera,
//   Fridge,
//   Toaster,
//   CoffeeMachine,
//   SmartTV,
//   RCAirplane,
//   RCCar,
//   Speakers,
//
//   ///  Cleaning robot
//   Roomba,
//
//   ///  Give water to plants
//   Irrigation,
//   SmartBed,
//   AnimalTracker,
//   SmartCar,
// }

// ///  List of all the wishes that can be made
// enum WishEnum {
//   SOn, //  Turn the device on
//   SOff, //  Turn the device off
//   SChangeState, //  Change device state to the opposite one
//   SDynamic, //  Set Dynamic Value
//   ODynamic, //  Open connection to change dynamic value
//   SMovement, //  Open connection to change dynamic value
//   GState, //  Get device state on/off
//   SBlindsUp, //  Turn the blinds up
//   SBlindsDown, //  Turn the blinds Down
//   SBlindsStop, //  Stop the blinds
//   SBoilerOn, // Turn on the boiler
//   SBoilerOff, // Turn off the boiler
// }

// /// List of all the sources
// enum WishSourceEnum {
//   ServerRequest,
//   FireBase,
//   ButtonPress,
//   VoiceAssistant,
//   ScheduleRequests,
// }

///  List of all physical devices types
enum PhysicalDeviceType {
  NanoPiDuo2,
  NanoPiAir,
  NanoPiNeo,
  NanoPiNeo2,
  RaspberryPi,
  NotSupported,
}

enum RaspberryPiType {
  Raspberry_Pi_3_Model_B_Rev_1_2,
  Raspberry_Pi_4_Model_B_Rev_1_4,
}

class EnumHelper {
  ///  Convert deviceType to string
  static String deviceTypeToString(DeviceTypes deviceType) {
    return deviceType.toString().replaceAll('DeviceTypes.', '');
  }

  static DeviceTypes stringToDeviceType(String deviceTypeString) {
    for (final DeviceTypes deviceType in DeviceTypes.values) {
      if (deviceTypeToString(deviceType) == deviceTypeString) {
        return deviceType;
      }
    }
    return null;
  }

  ///  Convert Raspberry Pi type to string
  static String RaspberryPiTypeToString(RaspberryPiType raspberryPiType) {
    return raspberryPiType.toString().replaceAll('RaspberryPiType.', '');
  }

  static RaspberryPiType stringToRaspberryPiType(String raspberryPiTypeString) {
    for (final RaspberryPiType raspberryPiType in RaspberryPiType.values) {
      if (RaspberryPiTypeToString(raspberryPiType) == raspberryPiTypeString) {
        return raspberryPiType;
      }
    }
    return null;
  }

  ///  Convert deviceAction to string
  static String deviceActionToString(DeviceActions actionEnum) {
    return actionEnum.toString().replaceAll('DeviceActions.', '');
  }

  ///  Convert string to deviceAction
  static DeviceActions stringToDeviceActions(String deviceActionString) {
    for (final DeviceActions deviceAction in DeviceActions.values) {
      if (deviceActionToString(deviceAction) == deviceActionString) {
        return deviceAction;
      }
    }
    return null;
  }

  ///  Convert physicalDeviceType to string
  static String physicalDeviceTypeToString(PhysicalDeviceType deviceType) {
    return deviceType.toString().replaceAll('PhysicalDeviceType.', '');
  }

  /// Return the corresponding SmartDeviceBaseAbstract Object of the deviceType
  static dynamic deviceTypeToSmartDeviceBaseAbstractObject(
      DeviceTypes deviceType) {
    switch (deviceType) {
      case DeviceTypes.light:
        return LightObject(null, null, null);
      case DeviceTypes.blinds:
        return BlindsObject(null, null, null, null, null, null, null, null);
      case DeviceTypes.boiler:
        return BoilerObject(null, null, null, null, null);
      default:
        print('Type $deviceType is not supported');
    }
    return null;
  }

  /// Returning the non abstract of this SmartDeviceBaseAbstract
  static Type getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
      SmartDeviceBaseAbstract smartDeviceBaseAbstract, DeviceTypes deviceType) {
    switch (deviceType) {
      case DeviceTypes.light:
        return LightObject;
      case DeviceTypes.blinds:
        return BlindsObject;
      case DeviceTypes.boiler:
        return BoilerObject;
      default:
        throw Exception('$deviceType Conditioner was not implemented yet');
    }
  }
}
