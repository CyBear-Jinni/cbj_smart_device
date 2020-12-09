import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/hive_d/hive_d.dart';

class LocalDbD {

  LocalDbD() {
    _hiveD = HiveD();
  }

  HiveD _hiveD;

  Future<Map<String, List<String>>> getListOfSmartDevices() {
    return _hiveD.getListOfSmartDevices();
  }

  Future<Map<String, String>> getListOfDatabaseInformation() {
    return _hiveD.getListOfDatabaseInformation();
  }

  void saveAllDevices(List<SmartDeviceBaseAbstract> smartDevicesList) {
    final Map<String, List<String>> smartDevicesMapList = <String,
        List<String>>{};

    for (final SmartDeviceBaseAbstract smartDeviceBaseAbstract in smartDevicesList) {
      final String deviceName = smartDeviceBaseAbstract.smartInstanceName;
      final String deviceTypeAsString = EnumHelper.deviceTypeToString(
          smartDeviceBaseAbstract.getDeviceType());
      String onOffPin;
      String onOffButtonPinNumber;
      if (smartDeviceBaseAbstract.onOffPin != null &&
          smartDeviceBaseAbstract.onOffPin.pinAndPhysicalPinConfiguration !=
              null) {
        onOffPin = smartDeviceBaseAbstract
            .onOffPin.pinAndPhysicalPinConfiguration
            .toString();
      }
      if (smartDeviceBaseAbstract.onOffButtonPin != null &&
          smartDeviceBaseAbstract
                  .onOffButtonPin.pinAndPhysicalPinConfiguration !=
              null) {
        onOffButtonPinNumber = smartDeviceBaseAbstract
            .onOffButtonPin.pinAndPhysicalPinConfiguration
            .toString();
      }
      if (smartDeviceBaseAbstract.getDeviceType() == DeviceType.Blinds) {
        final BlindsObject blindsObjectTemp = smartDeviceBaseAbstract as BlindsObject;

        String blindsUpPin = null,
            buttonPinUp = null,
            blindsDownPin = null,
            buttonPinDown = null;

        if (blindsObjectTemp.blindsUpPin != null) {
          blindsUpPin = blindsObjectTemp
              .blindsUpPin.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsUpPin != null) {
          buttonPinUp = blindsObjectTemp
              .buttonPinUp.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsDownPin != null) {
          blindsDownPin =
              blindsObjectTemp.blindsDownPin.pinAndPhysicalPinConfiguration
                  .toString();
        }

        if (blindsObjectTemp.buttonPinDown != null) {
          buttonPinDown =
              blindsObjectTemp.buttonPinDown.pinAndPhysicalPinConfiguration
                  .toString();
        }

        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          onOffPin,
          onOffButtonPinNumber,
          blindsUpPin,
          buttonPinUp,
          blindsDownPin,
          buttonPinDown
        ];
      } else {
        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          onOffPin,
          onOffButtonPinNumber
        ];
      }
    }

    _hiveD.saveAllDevices(smartDevicesMapList);
  }


  void saveListOfDatabaseInformation(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    final Map<String, String> firebaseAccountsInformationMap = <String, String>{
    };

    firebaseAccountsInformationMap[AccountsInformationD.fireBaseProjectId] =
        firebaseAccountsInformationD.fireBaseProjectId;
    firebaseAccountsInformationMap[AccountsInformationD.fireBaseApiKey] =
        firebaseAccountsInformationD.fireBaseApiKey;
    firebaseAccountsInformationMap[AccountsInformationD.userEmail] =
        firebaseAccountsInformationD.userEmail;
    firebaseAccountsInformationMap[AccountsInformationD.userPassword] =
        firebaseAccountsInformationD.userPassword;

    _hiveD.saveListOfDatabaseInformation(firebaseAccountsInformationMap);
  }

}
