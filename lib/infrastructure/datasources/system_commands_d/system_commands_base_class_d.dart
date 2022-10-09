abstract class SystemCommandsBaseClassD {
  Future<String> getCurrentUserName();

  Future<String> getUuidOfCurrentDevice();

  Future<String> getDeviceHostName();

  Future<String> getAllEtcReleaseFilesText();

  Future<String?> getFileContent(fileFullPath);

  Future<String?> getDeviceConfiguration();

  Future<String?> suspendComputer();

  Future<String?> shutdownComputer();

// TODO: Need to find a way in dart to get os environment variable
// /// Get Snap location environment variable "SNAP"
// Future<String> getSnapLocationEnvironmentVariable();
//
// /// Get Snap common environment variable "SNAP_COMMON" can be modified by root
// Future<String> getSnapCommonEnvironmentVariable();
//
// /// Get Snap user common environment variable "SNAP_USER_COMMON"
// Future<String> getSnapUserCommonEnvironmentVariable();

}
