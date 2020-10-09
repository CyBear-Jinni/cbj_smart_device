import 'dart:io';

class BashCommandsForRaspberryPi {
  static Future<String> getRaspberryPiDeviceVersion() async {
    String hostName = await Process.run(
            'cat', <String>['/proc/cpuinfo', '|', 'grep', 'Model'])
        .then((ProcessResult result) {
//      String hostName = result.stdout;
//      hostName = hostName.substring(
//          0, hostName.length - 1); //  Removes the invisible new line at the end
//      print('Host name: ' + hostName);
      return result.stdout.toString();
    });

    hostName = hostName.substring(hostName.indexOf(':') + 2);

    hostName = hostName
        .substring(0, hostName.indexOf('\n'))
        .replaceAll(' ', '_')
        .replaceAll('.', '_');

    return hostName;
  }
}
