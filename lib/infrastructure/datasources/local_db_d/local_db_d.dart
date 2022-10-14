import 'package:cbj_smart_device/application/usecases/button_object_u/button_with_light_object.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/domain/entities/core_e/enums_e.dart';
import 'package:cbj_smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:cbj_smart_device/infrastructure/datasources/hive_d/hive_d.dart';
import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

class LocalDbD {
  LocalDbD() {
    _hiveD = HiveD();
  }

  HiveD? _hiveD;

  Future<Map<String, List<String?>>?> getListOfSmartDevices() {
    return _hiveD!.getListOfSmartDevices();
  }

  Future<Map<String, String?>?> getListOfDatabaseInformation() {
    return _hiveD!.getListOfDatabaseInformation();
  }

  Future<void> saveAllDevices(
    List<SmartDeviceBaseAbstract> smartDevicesList,
  ) async {
    // TODO: We need to find better saving method since devices will save
    // a lot of rules in the future, like when to turn on by clock time and
    // what devices the button should change when press and more.
    final Map<String, List<String?>> smartDevicesMapList =
        <String, List<String?>>{};

    for (final SmartDeviceBaseAbstract smartDeviceBaseAbstract
        in smartDevicesList) {
      final String deviceName = smartDeviceBaseAbstract.id!;
      final String deviceTypeAsString = EnumHelper.deviceTypeToString(
        smartDeviceBaseAbstract.getDeviceType()!,
      );

      if (smartDeviceBaseAbstract.getDeviceType() == CbjDeviceTypes.blinds) {
        String? onOffPin;
        if (smartDeviceBaseAbstract.onOffPin != null &&
            smartDeviceBaseAbstract.onOffPin!.pinAndPhysicalPinConfiguration !=
                null) {
          onOffPin = smartDeviceBaseAbstract
              .onOffPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        final BlindsObject blindsObjectTemp =
            smartDeviceBaseAbstract as BlindsObject;

        String? onOffButtonPinNumber;

        if (smartDeviceBaseAbstract.onOffButtonPin != null &&
            smartDeviceBaseAbstract
                    .onOffButtonPin!.pinAndPhysicalPinConfiguration !=
                null) {
          onOffButtonPinNumber = smartDeviceBaseAbstract
              .onOffButtonPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        String? blindsUpPin, buttonPinUp, blindsDownPin, buttonPinDown;

        if (blindsObjectTemp.blindsUpPin != null) {
          blindsUpPin = blindsObjectTemp
              .blindsUpPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsUpPin != null) {
          buttonPinUp = blindsObjectTemp
              .buttonPinUp!.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.blindsDownPin != null) {
          blindsDownPin = blindsObjectTemp
              .blindsDownPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        if (blindsObjectTemp.buttonPinDown != null) {
          buttonPinDown = blindsObjectTemp
              .buttonPinDown!.pinAndPhysicalPinConfiguration
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
      } else if (smartDeviceBaseAbstract.getDeviceType() ==
          CbjDeviceTypes.light) {
        String? onOffPin;
        if (smartDeviceBaseAbstract.onOffPin != null &&
            smartDeviceBaseAbstract.onOffPin!.pinAndPhysicalPinConfiguration !=
                null) {
          onOffPin = smartDeviceBaseAbstract
              .onOffPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        smartDevicesMapList[deviceName] = [deviceTypeAsString, onOffPin];
      } else if (smartDeviceBaseAbstract.getDeviceType() ==
          CbjDeviceTypes.boiler) {
        String? onOffPin;
        if (smartDeviceBaseAbstract.onOffPin != null &&
            smartDeviceBaseAbstract.onOffPin!.pinAndPhysicalPinConfiguration !=
                null) {
          onOffPin = smartDeviceBaseAbstract
              .onOffPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        final BoilerObject boilerObjectTemp =
            smartDeviceBaseAbstract as BoilerObject;

        String? onOffButtonPinNumber;

        if (smartDeviceBaseAbstract.onOffButtonPin != null &&
            smartDeviceBaseAbstract
                    .onOffButtonPin!.pinAndPhysicalPinConfiguration !=
                null) {
          onOffButtonPinNumber = smartDeviceBaseAbstract
              .onOffButtonPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        String? boilerPin, boilerButtonPin;

        if (boilerObjectTemp.boilerPin != null &&
            boilerObjectTemp.boilerPin!.pinAndPhysicalPinConfiguration !=
                null) {
          boilerPin = boilerObjectTemp.boilerPin!.pinAndPhysicalPinConfiguration
              .toString();
        }
        if (boilerObjectTemp.boilerButtonPin != null &&
            boilerObjectTemp.boilerButtonPin!.pinAndPhysicalPinConfiguration !=
                null) {
          boilerButtonPin = boilerObjectTemp
              .boilerButtonPin!.pinAndPhysicalPinConfiguration
              .toString();
        }

        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          boilerPin,
          boilerButtonPin,
          onOffPin,
          onOffButtonPinNumber
        ];
      } else if (smartDeviceBaseAbstract.getDeviceType() ==
          CbjDeviceTypes.button) {
        final ButtonObject tempButtonO =
            smartDeviceBaseAbstract as ButtonObject;
        String? buttonPressPin;
        if (tempButtonO.buttonPin != null &&
            tempButtonO.buttonPin!.pinAndPhysicalPinConfiguration != null) {
          buttonPressPin =
              tempButtonO.buttonPin!.pinAndPhysicalPinConfiguration.toString();
        }

        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          buttonPressPin,
        ];
      } else if (smartDeviceBaseAbstract.getDeviceType() ==
          CbjDeviceTypes.buttonWithLight) {
        final ButtonWithLightObject tempButtonO =
            smartDeviceBaseAbstract as ButtonWithLightObject;
        String? buttonPressPin;
        if (tempButtonO.buttonPin != null &&
            tempButtonO.buttonPin!.pinAndPhysicalPinConfiguration != null) {
          buttonPressPin =
              tempButtonO.buttonPin!.pinAndPhysicalPinConfiguration.toString();
        }
        String? buttonLightPin;
        if (tempButtonO.buttonLight != null &&
            tempButtonO.buttonLight!.pinAndPhysicalPinConfiguration != null) {
          buttonLightPin = tempButtonO
              .buttonLight!.pinAndPhysicalPinConfiguration
              .toString();
        }

        smartDevicesMapList[deviceName] = [
          deviceTypeAsString,
          buttonPressPin,
          buttonLightPin,
        ];
      } else {
        print("Can't save device, type "
            '${smartDeviceBaseAbstract.getDeviceType()} is not supported');
      }
    }

    await _hiveD?.saveAllDevices(smartDevicesMapList);
    return;
  }

  void saveListOfDatabaseInformation(
    FirebaseAccountsInformationD firebaseAccountsInformationD,
  ) {
    final Map<String, String> firebaseAccountsInformationMap =
        <String, String>{};

    firebaseAccountsInformationMap[AccountsInformationD.fireBaseProjectId] =
        firebaseAccountsInformationD.fireBaseProjectId;
    firebaseAccountsInformationMap[AccountsInformationD.fireBaseApiKey] =
        firebaseAccountsInformationD.fireBaseApiKey;
    firebaseAccountsInformationMap[AccountsInformationD.userEmail] =
        firebaseAccountsInformationD.userEmail;
    firebaseAccountsInformationMap[AccountsInformationD.userPassword] =
        firebaseAccountsInformationD.userPassword;
    firebaseAccountsInformationMap[AccountsInformationD.homeId] =
        firebaseAccountsInformationD.homeId;

    _hiveD?.saveListOfDatabaseInformation(firebaseAccountsInformationMap);
  }
}
