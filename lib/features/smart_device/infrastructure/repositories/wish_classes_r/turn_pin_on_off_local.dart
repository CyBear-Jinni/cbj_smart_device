import 'dart:io';

import 'package:cbj_smart_device/core/shared_variables.dart';
import 'package:cbj_smart_device/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/pin_setup_method_enum.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/wish_classes_d/wish_classes_d.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local_abstract.dart';

class TurnPinOnOffLocal extends TurnPinOnOffLocalAbstract {
  TurnPinOnOffLocal() {
    _wishClassesD = WishClassesD();
  }

  WishClassesD? _wishClassesD;

  ///  Function to start c script to interact with pins
  @override
  Future<String> pinOn(PinInformation? pinNumber) async {
    if (pinNumber?.pinAndPhysicalPinConfiguration == null) {
      print('Error PinInformation.pinAndPhysicalPinConfiguration was not set');
      return 'Error PinInformation.pinAndPhysicalPinConfiguration was not set';
    }
    if (SharedVariables.getProjectRootDirectoryPath() == null) {
      print('Error SharedVariables.GetProjectRootDirectoryPath was not set');
      return 'Error SharedVariables.GetProjectRootDirectoryPath was not set';
    }

    try {
      print(
          'This is the pin number on ${pinNumber!.pinAndPhysicalPinConfiguration}');
      return await _wishClassesD!
          .turnOnLocalPhysicalPin(PinSetupMethodEnum.wiringPiSetupPhys,
              pinNumber.pinAndPhysicalPinConfiguration.toString())
          .then((ProcessResult results) {
        print(results.stdout);
        return results.stdout.toString();
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: $error');
      return 'Path/argument 1 is not specified';
    }
  }

  @override
  Future<String> pinOff(PinInformation? pinNumber) async {
    if (pinNumber?.pinAndPhysicalPinConfiguration == null) {
      print('Error PinInformation.pinAndPhysicalPinConfiguration was not set');
      return 'Error PinInformation.pinAndPhysicalPinConfiguration was not set';
    }

    try {
      print(
          'This is the pin number off: ${pinNumber?.pinAndPhysicalPinConfiguration}');
      return _wishClassesD!
          .turnOffLocalPhysicalPin(PinSetupMethodEnum.wiringPiSetupPhys,
              pinNumber!.pinAndPhysicalPinConfiguration.toString())
          .then((ProcessResult results) {
        print(results.stdout);
        return results.stdout.toString();
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: $error');
      return 'Path/argument 1 is not specified';
    }
  }
}

class TurnPinOnOffPc extends TurnPinOnOffLocalAbstract {
  @override
  Future<String> pinOff(PinInformation pinNumber) {
    return Future<String>.value('Success');
  }

  @override
  Future<String> pinOn(PinInformation pinNumber) {
    return Future<String>.value('Success');
  }
}
