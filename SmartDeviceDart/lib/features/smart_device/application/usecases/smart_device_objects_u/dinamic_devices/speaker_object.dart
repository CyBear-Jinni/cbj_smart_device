import '../abstracts_devices/smart_device_dynamic_abstract.dart';

class SpeakerObject extends SmartDeviceDynamicAbstract {
  SpeakerObject(uuid, smartInstanceName, onOffPinNumber, {onOffButtonPinNumber})
      : super(uuid, smartInstanceName, onOffPinNumber,
            onOffButtonPinNumber: onOffButtonPinNumber);
}
