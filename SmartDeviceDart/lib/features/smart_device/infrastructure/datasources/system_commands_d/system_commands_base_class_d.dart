abstract class SystemCommandsBaseClassD {
  Future<String> getCurrentUserName();

  Future<String> getUuidOfCurrentDevice();

  Future<String> getDeviceHostName();

  Future<String> getFileContent(fileFullPath);

  Future<String> getDeviceConfiguration();
}
