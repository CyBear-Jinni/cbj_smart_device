import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/set_devices_d/set_devices_d.dart';

class SetDevicesR {
  SetDevicesR() {
    _setDevicesD = SetDevicesD();
  }

  SetDevicesD? _setDevicesD;

  Future<String> getCurrentDeviceUUid() {
    return _setDevicesD!.getCurrentDeviceUUid();
  }

  Future<String?> getDeviceDefaultConfig() {
    return _setDevicesD!.getDeviceDefaultConfig();
  }
}
