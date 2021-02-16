import 'dart:io';

import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_base_class_d.dart';

class CommonBashCommandsD implements SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
    final String whoami =
        await Process.run('whoami', <String>[]).then((ProcessResult result) {
      return result.stdout.toString();
    });
    return whoami.substring(0, whoami.indexOf('\n'));
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    String df = await Process.run('df', <String>['-h', '/'])
        .then((ProcessResult result) {
      return result.stdout.toString();
    });

    df = df.substring(df.indexOf('\n') + 1);
    df = df.substring(0, df.indexOf(' '));

    //  The full bash command looks like this /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"
    String blkid =
        await Process.run('/sbin/blkid', []).then((ProcessResult result) {
      return result.stdout.toString();
    });

    if (blkid.contains(df)) {
      blkid = blkid.substring(blkid.indexOf(df));
    } else if (blkid.contains('/dev/mmcblk0p2')) {
      blkid = blkid.substring(blkid.indexOf('/dev/mmcblk0p2'));
    } else {
      blkid = blkid.substring(blkid.indexOf('/dev/'));
    }

    blkid = blkid.substring(0, blkid.indexOf('\n'));

    String uuid = blkid.substring(blkid.indexOf('UUID="') + 6);
    uuid = uuid.substring(0, uuid.indexOf('"'));

    return uuid;
  }

  @override
  Future<String> getDeviceHostName() async {
    String hostName = await Process.run('hostname', <String>['-s'])
        .then((ProcessResult result) {
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
    final String fileContent =
        await Process.run('cat', <String>[fileFullPath.toString()])
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
