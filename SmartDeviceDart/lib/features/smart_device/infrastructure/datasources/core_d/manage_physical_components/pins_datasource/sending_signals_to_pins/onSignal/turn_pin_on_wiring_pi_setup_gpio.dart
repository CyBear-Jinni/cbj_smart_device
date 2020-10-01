import 'dart:io';

import '../../../../../../../../../core/shared_variables.dart';

class TurnPinOnWiringPiSetupGpio {
  Future<ProcessResult> TurnThePinOn(String physicalPinNumber) async {
    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupGpio',
        [physicalPinNumber]);
  }
}
