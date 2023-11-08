import 'dart:io';

import 'package:cbj_integrations_controller/infrastructure/shared_variables.dart';

class ListenToPinHighWiringPiSetupPhys {
  ///  Listen to button press once and return exist code
  Future<int> listenToButtonPress(String pinNumber) async {
    return Process.run(
      '${SharedVariables.instance.getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/gettingSignals/listenToPinHighWiringPiSetupPhys',
      <String>[pinNumber],
    ).then((ProcessResult results) {
      if (results.stdout.toString().length == 96) {
        return -1;
      }
      return 0;
    });
  }
}
