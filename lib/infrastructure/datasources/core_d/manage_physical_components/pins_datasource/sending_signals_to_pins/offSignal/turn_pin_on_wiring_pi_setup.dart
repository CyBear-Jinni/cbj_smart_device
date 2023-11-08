import 'dart:io';

import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';

class TurnPinOffWiringPiSetup {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables.instance.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetup',
      [physicalPinNumber],
    );
  }
}
