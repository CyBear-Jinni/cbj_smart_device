import 'device_configuration_base_class.dart';
import 'pin_information.dart';

class NanoPiNeoConfiguration extends DeviceConfigurationBaseClass {
  NanoPiNeoConfiguration() {
    pinList = _pinListNanoPiNeo;
  }

  static final List<PinInformation> _pinListNanoPiNeo = <PinInformation>[];
}
