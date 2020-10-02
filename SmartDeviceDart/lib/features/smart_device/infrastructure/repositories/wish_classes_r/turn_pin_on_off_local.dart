import 'dart:io';

import '../../../../../core/shared_variables.dart';
import '../../../application/usecases/devices_pin_configuration_u/pin_information.dart';
import '../../datasources/core_d/manage_physical_components/pins_datasource/pin_setup_method_enum.dart';
import '../../datasources/wish_classes_d/wish_classes_d.dart';
import 'turn_pin_on_off_local_abstract.dart';

class TurnPinOnOffLocal extends TurnPinOnOffLocalAbstract {
  WishClassesD _wishClassesD;

  TurnPinOnOffLocal() {
    _wishClassesD = WishClassesD();
  }

//  Function to start c script to interact with pins
  @override
  Future<String> pinOn(PinInformation pinNumber) async {
    if (pinNumber.pinAndPhysicalPinConfiguration == null) {
      print('Error PinInformation.pinAndPhysicalPinConfiguration was not set');
      return 'Error PinInformation.pinAndPhysicalPinConfiguration was not set';
    }
    if (SharedVariables.getProjectRootDirectoryPath() == null) {
      print('Error SharedVariables.GetProjectRootDirectoryPath was not set');
      return 'Error SharedVariables.GetProjectRootDirectoryPath was not set';
    }

    try {
      print('This is the pin number on ' +
          pinNumber.pinAndPhysicalPinConfiguration.toString());
      return await _wishClassesD
          .turnOnLocalPhysicalPin(PinSetupMethodEnum.wiringPiSetupPhys,
              pinNumber.pinAndPhysicalPinConfiguration.toString())
          .then((ProcessResult results) {
        print(results.stdout);
        return results.stdout.toString();
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return 'Path/argument 1 is not specified';
    }
  }

  @override
  Future<String> pinOff(PinInformation pinNumber) async {
    try {
      print('This is the pin number off:  ' +
          pinNumber.pinAndPhysicalPinConfiguration.toString());
      return _wishClassesD
          .turnOffLocalPhysicalPin(PinSetupMethodEnum.wiringPiSetupPhys,
              pinNumber.pinAndPhysicalPinConfiguration.toString())
          .then((ProcessResult results) {
        print(results.stdout);
        return results.stdout.toString();
      });
    } catch (error) {
      print('Path/argument 1 is not specified');
      print('error: ' + error.toString());
      return 'Path/argument 1 is not specified';
    }
  }
}

class TurnPinOnOffPc extends TurnPinOnOffLocalAbstract {
  @override
  Future<String> pinOff(PinInformation pinNumber) {
    return Future.value('Sucess');
  }

  @override
  Future<String> pinOn(PinInformation pinNumber) {
    return Future.value('Sucess');
  }
}
