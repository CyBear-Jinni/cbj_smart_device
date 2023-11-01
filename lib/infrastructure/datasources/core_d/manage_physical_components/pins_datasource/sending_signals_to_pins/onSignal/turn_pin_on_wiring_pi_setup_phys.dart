import 'dart:io';

import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';

class TurnPinOnWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables.instance.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupPhys',
      <String>[physicalPinNumber],
    );
  }
}
