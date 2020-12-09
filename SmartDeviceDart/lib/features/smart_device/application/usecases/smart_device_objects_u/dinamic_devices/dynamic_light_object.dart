import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';

class DynamicLightObject extends SmartDeviceDynamicAbstract {
  DynamicLightObject(String uuid, String smartInstanceName, int onOffPinNumber,
      {int onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);
}
