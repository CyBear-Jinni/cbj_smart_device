import 'dart:io';

import 'package:cbj_smart_device/core/shared_variables.dart';

class TurnPinOnWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupPhys',
      <String>[physicalPinNumber],
    );
  }
}
