import 'dart:io';

import 'package:cbj_smart_device/core/shared_variables.dart';

class TurnPinOffWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupPhys',
      [physicalPinNumber],
    );
  }
}
