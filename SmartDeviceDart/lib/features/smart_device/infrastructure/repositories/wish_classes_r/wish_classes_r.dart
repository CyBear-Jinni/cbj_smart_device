import '../../../application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'turn_pin_on_off_local.dart';

class WishClassesR {
  Future<String> pinOff(PinInformation pinNumber) {
    return TurnPinOnOffLocal().pinOff(pinNumber);
  }
}
