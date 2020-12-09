import 'dart:io';

import 'package:smart_device_dart/core/shared_variables.dart';

class TurnPinOnWiringPiSetup {
  Future<ProcessResult> TurnThePinOn(String physicalPinNumber) async {
    return Process.run(
        '${SharedVariables.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetup',
        [physicalPinNumber]);
  }
}
