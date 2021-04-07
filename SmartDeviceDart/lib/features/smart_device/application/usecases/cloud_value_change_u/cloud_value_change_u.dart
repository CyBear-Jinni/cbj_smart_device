import 'dart:async';
import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firedart/firedart.dart';
import 'package:smart_device_dart/core/my_singleton.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/cloud_value_change_e/cloud_value_change_e.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';

class CloudValueChangeU {
  CloudValueChangeU(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudValueChangeU = this;
    _cloudValueChangeEntity = CloudValueChangeE(firebaseAccountsInformationD);
  }

  static CloudValueChangeU _cloudValueChangeU;
  CloudValueChangeE _cloudValueChangeEntity;

  void setNewFirebaseAccounInfo(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudValueChangeEntity
        .setNewFirebaseAccounInfo(firebaseAccountsInformationD);
  }

  static CloudValueChangeU getCloudValueChangeU() {
    return _cloudValueChangeU;
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _cloudValueChangeEntity.updateDocument(fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocument(
      String deviceId, String fieldToUpdate, String valueToUpdate) {
    return _cloudValueChangeEntity.updateDeviceDocument(
        deviceId, fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocumentWithMap(
      String deviceId, Map<String, String> mapToUpdate) {
    return _cloudValueChangeEntity.updateDeviceDocumentWithMap(
        deviceId, mapToUpdate);
  }

  ///  Listen to changes in the database for this device
  Future<void> listenToDataBase() async {
    final List<AddressCheckOptions> DEFAULTADDRESSES =
        List<AddressCheckOptions>.unmodifiable([
      AddressCheckOptions(
        InternetAddress('1.1.1.1'), // CloudFlare
      ),
      AddressCheckOptions(
        InternetAddress('208.67.222.222'), // OpenDNS
      ),
    ]);

    DataConnectionChecker().addresses = DEFAULTADDRESSES;

    while (true) {
      final bool result = await DataConnectionChecker().hasConnection;
      if (result == true) {
        print('Have internet');
        break;
      }
      print('No internet');
      await Future.delayed(const Duration(seconds: 10));
    }

    listenToCollectionChange();
  }

  Future<void> listenToCollectionChange() async {
    _cloudValueChangeEntity
        .listenToCollectionDataBase()
        .listen((List<Document> documentList) {
      print('Change detected in Firestore');

      final Map<SmartDeviceBaseAbstract, String> devicesNamesThatValueChanged =
          {};

      documentList.forEach((Document document) {
        MySingleton.getSmartDevicesList()
            .forEach((SmartDeviceBaseAbstract element) {
          if (document.id == element.id) {
            if (document.map['state'].toString() != 'ack') {
              devicesNamesThatValueChanged[element] =
                  document.map['action'].toString();
            }
          }
        });
      });

      devicesNamesThatValueChanged.forEach(
          (SmartDeviceBaseAbstract smartDeviceBaseAbstract, String value) {
        print('FireBase "${smartDeviceBaseAbstract.id}" have different value,'
            ' will now change to $value');
        WishEnum wishEnum;
        switch (value) {
          case 'on':
            wishEnum = WishEnum.SOn;
            break;
          case 'off':
            wishEnum = WishEnum.SOff;
            break;
          default:
            wishEnum = EnumHelper.stringToWishEnum(value);
            break;
        }
        ActionsToPreformU.executeWishEnum(
            smartDeviceBaseAbstract, wishEnum, WishSourceEnum.FireBase);
      });
    });
  }

  Future<void> listenToDocumentChange() async {
    _cloudValueChangeEntity
        .listenToDocumentDataBase()
        .listen((Document document) {
      final Document firestoreDocument = document;
      print('Change detected to Document Firestore');

      final Map<SmartDeviceBaseAbstract, String> devicesNamesThatValueChanged =
          <SmartDeviceBaseAbstract, String>{};

      MySingleton.getSmartDevicesList()
          .forEach((SmartDeviceBaseAbstract element) {
        if (firestoreDocument.map.containsKey(element.id)) {
          if (element.getDeviceState() != firestoreDocument.map[element.id]) {
            devicesNamesThatValueChanged[element] =
                firestoreDocument.map[element.id].toString();
          }
        }
      });

      devicesNamesThatValueChanged.forEach(
          (SmartDeviceBaseAbstract smartDeviceBaseAbstract, String value) {
        print(
            'FireBase "${smartDeviceBaseAbstract.id}" have different value, will now change to $value');
        WishEnum wishEnum;
        switch (value) {
          case 'true':
            wishEnum = WishEnum.SOn;
            break;
          case 'false':
            wishEnum = WishEnum.SOff;
            break;
          default:
            wishEnum = EnumHelper.stringToWishEnum(value);
            break;
        }
        ActionsToPreformU.executeWishEnum(
            smartDeviceBaseAbstract, wishEnum, WishSourceEnum.FireBase);
      });
    });
  }
}
