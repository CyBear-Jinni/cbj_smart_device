import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_base_class_d.dart';

class CommonBatchCommandsD implements SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
    String whoami = await Process.run('cmd', ['/C', 'echo', '%username%'])
        .then((ProcessResult result) {
      return result.stdout;
    });
    return whoami.substring(0, whoami.indexOf('\r'));
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    String uuid = await Process.run('cmd', [
      '/C',
      'wmic',
      'path',
      'win32_computersystemproduct',
      'get',
      'uuid'
    ]).then((ProcessResult result) {
      return result.stdout;
    });
    return uuid
        .substring(uuid.indexOf('\n') + 1)
        .substring(0, uuid.indexOf('\r'))
        .substring(0, uuid.indexOf(' '));
  }

  @override
  Future<String> getDeviceHostName() async {
    String hostName = await Process.run('cmd', ['/C', 'echo', '%COMPUTERNAME%'])
        .then((ProcessResult result) {
      return result.stdout;
    });
    return hostName.substring(0, hostName.indexOf('\r'));
  }

  @override
  Future<String> getFileContent(fileFullPath) async {
    String fileText = await Process.run('cmd', ['/C', 'more', fileFullPath])
        .then((ProcessResult result) {
      return result.stdout;
    });
    return fileText;
  }

  @override
  Future<String> getDeviceConfiguration() async {
    // String fileFullPath = (await getOsDriveLetter())  + r'\Users\' + (await getCurrentUserName()) + r'\Documents\cbjinni\deviceConfigs.txt'; // Needed to fix function getOsDriveLetter before
    String fileFullPath = (await getCurrentDriveLetter()) +
        r'\Users\' +
        (await getCurrentUserName()) +
        r'\Documents\cbjinni\deviceConfigs.txt'; // Will only work if the program located in the os driver

    String fileContent = await getFileContent(fileFullPath);
    if (fileContent.isEmpty) {
      // Windows is weird and needs help
      fileContent = await getFileContent(fileFullPath + '.txt');
    }
    if (fileContent.isEmpty) {
      print('Config file does not exist or empty, path searching: ' +
          fileFullPath);
      return '';
    }
    return fileContent.substring(0, fileContent.indexOf('\r'));
    ;
  }

  Future<String> getCurrentDriveLetter() async {
    String driveLetter = await Process.run('cmd', ['/C', 'echo', '%cd:~0,2%'])
        .then((ProcessResult result) {
      return result.stdout;
    });
    return driveLetter.substring(0, driveLetter.indexOf('\r'));
  }

  //TODO: Currently does not work as echo %~dp0 will not work at the command line, only in a batch file.
  Future<String> getOsDriveLetter() async {
    String driveLetter = await Process.run('cmd', ['/C', 'echo', '%~d0'])
        .then((ProcessResult result) {
      return result.stdout;
    });
    return driveLetter.substring(0, driveLetter.indexOf('\r'));
  }
}
