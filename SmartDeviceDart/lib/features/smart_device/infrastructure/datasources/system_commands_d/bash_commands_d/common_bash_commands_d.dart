import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_base_class_d.dart';

class CommonBashCommandsD implements SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
    String whoami =
        await Process.run('whoami', []).then((ProcessResult result) {
      return result.stdout.toString();
    });
    return await whoami.substring(0, whoami.indexOf('\n'));
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    String df =
        await Process.run('df', ['-h', '/']).then((ProcessResult result) {
          return result.stdout.toString();
    });

    df = df.substring(df.indexOf('\n') + 1);
    df = df.substring(0, df.indexOf(' '));

    //  The full bash command looks like this /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"
    String blkid =
        await Process.run('/sbin/blkid', []).then((ProcessResult result) {
          return result.stdout.toString();
    });

    blkid = blkid.substring(blkid.indexOf(df));
    blkid = blkid.substring(0, blkid.indexOf('\n'));

    String uuid = blkid.substring(blkid.indexOf('UUID="') + 6);
    uuid = uuid.substring(0, uuid.indexOf('"'));

    return uuid;
  }

  @override
  Future<String> getDeviceHostName() async {
    String hostName =
    await Process.run('hostname', ['-s']).then((ProcessResult result) {
//      String hostName = result.stdout;
//      hostName = hostName.substring(
//          0, hostName.length - 1); //  Removes the invisible new line at the end
//      print('Host name: ' + hostName);
      return result.stdout.toString();
    });
    return hostName.substring(0, hostName.indexOf('\n'));
  }

  @override
  Future<String> getFileContent(fileFullPath) async {
    String fileContent = await Process.run('cat', [fileFullPath.toString()])
        .then((ProcessResult result) {
      return result.stdout.toString();
    });

    if (fileContent == '') {
      return null;
    }
    return fileContent;
  }

  @override
  Future<String> getDeviceConfiguration() {
    return getFileContent('/etc/cbjinni/deviceConfigs.txt');
  }
}
