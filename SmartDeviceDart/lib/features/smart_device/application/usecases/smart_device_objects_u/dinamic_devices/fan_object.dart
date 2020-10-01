import '../abstracts_devices/smart_device_dynamic_abstract.dart';

class FanObject extends SmartDeviceDynamicAbstract {
  FanObject(uuid, smartInstanceName, onOffPinNumber, {onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);
}
