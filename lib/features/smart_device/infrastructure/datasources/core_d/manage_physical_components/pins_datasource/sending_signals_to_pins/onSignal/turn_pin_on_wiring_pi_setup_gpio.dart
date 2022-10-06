import 'dart:io';

import 'package:cbj_smart_device/core/shared_variables.dart';

class TurnPinOnWiringPiSetupGpio {
  Future<ProcessResult> TurnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupGpio',
      [physicalPinNumber],
    );
  }
}
