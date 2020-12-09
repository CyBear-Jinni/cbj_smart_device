import 'dart:io';

import 'package:smart_device_dart/core/shared_variables.dart';

class TurnPinOffWiringPiSetup {
  Future<ProcessResult> TurnThePinOff(String physicalPinNumber) async {
    return Process.run(
        '${SharedVariables.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetup',
        [physicalPinNumber]);
  }
}
