import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/dinamic_devices/dynamic_light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/dinamic_devices/fan_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/dinamic_devices/speaker_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/simple_devices/thermostat_object.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';

enum DeviceType {
  Light, //  Light ON/OFF
  DynamicLight, //  Light with brightness 0% to 100%
  Blinds,
  Thermostat,
  Fan,
  AirConditioner,
  Camera,
  Fridge,
  Toaster,
  CoffeeMachine,
  SmartTV,
  RCAirplane,
  RCCar,
  Speakers,

  ///  Cleaning robot
  Roomba,

  ///  Give water to plants
  Irrigation,
  SmartBed,
  AnimalTracker,
  SmartCar
}

///  List of all the wishes that can be made
enum WishEnum {
  SOn, //  Turn the device on
  SOff, //  Turn the device off
  SChangeState, //  Change device state to the opposite one
  SDynamic, //  Set Dynamic Value
  ODynamic, //  Open connection to change dynamic value
  SMovement, //  Open connection to change dynamic value
  GState, //  Get device state on/off
  SBlindsUp, //  Turn the blinds up
  SBlindsDown, //  Turn the blinds Down
  SBlindsStop //  Stop the blinds
}

/// List of all the sources
enum WishSourceEnum {
  ServerRequest,
  FireBase,
  ButtonPress,
  VoiceAssistant,
  ScheduleRequests,
}

///  List of all physical devices types
enum PhysicalDeviceType {
  NanoPiDuo2,
  NanoPiAir,
  NanoPiNeo,
  NanoPiNeo2,
  RaspberryPi,
  NotSupported
}

enum RaspberryPiType {
  Raspberry_Pi_3_Model_B_Rev_1_2,
  Raspberry_Pi_4_Model_B_Rev_1_4
}

class EnumHelper {
  ///  Convert deviceType to string
  static String deviceTypeToString(DeviceType deviceType) {
    return deviceType.toString().replaceAll('DeviceType.', '');
  }

  static DeviceType stringToDeviceType(String deviceTypeString) {
    for (final DeviceType deviceType in DeviceType.values) {
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

  ///  Convert wishEnum to string
  static String wishEnumToString(WishEnum wishEnum) {
    return wishEnum.toString().replaceAll('WishEnum.', '');
  }

  ///  Convert string to wishEnum
  static WishEnum stringToWishEnum(String wishEnumString) {
    for (final WishEnum wishEnum in WishEnum.values) {
      if (wishEnumToString(wishEnum) == wishEnumString) {
        return wishEnum;
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
      DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.Light:
        return LightObject(null, null, null);
      case DeviceType.DynamicLight:
        return DynamicLightObject(null, null, null);
      case DeviceType.Blinds:
        return BlindsObject(null, null, null, null, null, null, null, null);
      case DeviceType.Thermostat:
        return ThermostatObject(null, null, null);
      case DeviceType.Fan:
        return FanObject(null, null, null);
      case DeviceType.AirConditioner:
        return null;
      case DeviceType.Camera:
        return null;
      case DeviceType.Fridge:
        return null;
      case DeviceType.Toaster:
        return null;
      case DeviceType.CoffeeMachine:
        return null;
      case DeviceType.SmartTV:
        return null;
      case DeviceType.RCAirplane:
        return null;
      case DeviceType.RCCar:
        return null;
      case DeviceType.Speakers:
        return SpeakerObject(null, null, null);
      case DeviceType.Roomba:
        return null;
      case DeviceType.Irrigation:
        return null;
      case DeviceType.SmartBed:
        return null;
      case DeviceType.AnimalTracker:
        return null;
      case DeviceType.SmartCar:
        return null;
    }
    return null;
  }

  /// Returning the non abstract of this SmartDeviceBaseAbstract
  static Type getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
      SmartDeviceBaseAbstract smartDeviceBaseAbstract, DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.Light:
        return LightObject;
      case DeviceType.DynamicLight:
        return DynamicLightObject;
      case DeviceType.Blinds:
        return BlindsObject;
      case DeviceType.Thermostat:
        return ThermostatObject;
      case DeviceType.Fan:
        return FanObject;
      case DeviceType.AirConditioner:
        throw Exception('Air Conditioner was not implemented yet');
      case DeviceType.Camera:
        throw Exception('Camera was not implemented yet');
      case DeviceType.Fridge:
        throw Exception('Fridge was not implemented yet');
      case DeviceType.Toaster:
        throw Exception('Toaster was not implemented yet');
      case DeviceType.CoffeeMachine:
        throw Exception('Coffee Machine was not implemented yet');
      case DeviceType.SmartTV:
        throw Exception('Smart TV was not implemented yet');
      case DeviceType.RCAirplane:
        throw Exception('RC Airplane was not implemented yet');
      case DeviceType.RCCar:
        throw Exception('RC Car was not implemented yet');
      case DeviceType.Speakers:
        return SpeakerObject;
      case DeviceType.Roomba:
        throw Exception('Roomba was not implemented yet');
      case DeviceType.Irrigation:
        throw Exception('Irrigation was not implemented yet');
      case DeviceType.SmartBed:
        throw Exception('Smart Bed was not implemented yet');
      case DeviceType.AnimalTracker:
        throw Exception('Animal Tracker was not implemented yet');
      case DeviceType.SmartCar:
        throw Exception('Smart Car was not implemented yet');
    }
    throw Exception('This Type was not implemented yet');
  }
}
