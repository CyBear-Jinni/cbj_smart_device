import 'package:smart_device_dart/features/smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/button_object_d/button_object_d.dart';

class ButtonObjectR {
  ButtonObjectR() {
    _buttonObjectDataSource = ButtonObjectD();
  }

  ButtonObjectD _buttonObjectDataSource;

  Future<int> listenToButtonPress(PinInformation buttonPinNumber) {
    return _buttonObjectDataSource.listenToButtonPress(buttonPinNumber);
  }
}
