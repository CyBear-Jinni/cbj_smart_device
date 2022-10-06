import 'package:cbj_smart_device/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/repositories/wish_classes_r/wish_classes_r.dart';

class WishClassesE {
  WishClassesE() {
    _wishClassesR = WishClassesR();
  }

  WishClassesR? _wishClassesR;

  Future<String> pinOff(PinInformation? pinNumber) {
    return _wishClassesR!.pinOff(pinNumber);
  }
}
