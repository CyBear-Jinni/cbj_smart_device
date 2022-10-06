import 'package:cbj_smart_device/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';

class FanObject extends SmartDeviceDynamicAbstract {
  FanObject(String uuid, String smartInstanceName, int onOffPinNumber,
      {int? onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);
}
