import 'dart:io';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/bash_commands_d/common_bash_commands_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/batch_commands_d/common_batch_commands_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_base_class_d.dart';

class SystemCommandsManager {

  SystemCommandsManager() {
    if (Platform.isLinux) {
      print('Linux platform detected');
      systemCommandsBaseClassD = CommonBashCommandsD();
    } else if (Platform.isWindows) {
      print('Windows platform detected');
      systemCommandsBaseClassD = CommonBatchCommandsD();
    } else if (Platform.isMacOS) {
      print('Mac os is currently not supported');
      throw ('Mac os is currently not supported');
    } else {
      print('${Platform.operatingSystem} os is not supported');
      throw ('${Platform.operatingSystem} os is not supported');
    }
  }

  SystemCommandsBaseClassD systemCommandsBaseClassD;

  Future<String> getCurrentUserName() {
    return systemCommandsBaseClassD.getCurrentUserName();
  }

  Future<String> getDeviceHostName() {
    return systemCommandsBaseClassD.getDeviceHostName();
  }

  Future<String> getFileContent(fileFullPath) {
    return systemCommandsBaseClassD.getFileContent(fileFullPath);
  }

  Future<String> getUuidOfCurrentDevice() {
    return systemCommandsBaseClassD.getUuidOfCurrentDevice();
  }

  Future<String> getDeviceConfiguration() {
    return systemCommandsBaseClassD.getDeviceConfiguration();
  }
}
