import 'package:firedart/firestore/models.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/cloud_value_change_r/cloud_value_change_r.dart';

class CloudValueChangeE {
  CloudValueChangeE(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    if (doesFirebaseAccountLogit(firebaseAccountsInformationD)) {
      _cloudManager ??= CloudManagerR(firebaseAccountsInformationD);
//    MySingleton.getSmartDevicesList()[0];
    }
  }

  static CloudManagerR _cloudManager;

  Stream<Document> listenToDocumentDataBase() async* {
    yield* _cloudManager.listenToDocumentInDataBase();
  }

  Stream<List<Document>> listenToCollectionDataBase() async* {
    yield* _cloudManager.listenToCollectionInDataBase();
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _cloudManager.updateDocument(fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocument(
      String deviceId, String fieldToUpdate, String valueToUpdate) {
    return _cloudManager.updateDeviceDocument(
        deviceId, fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocumentWithMap(
      String deviceId, Map<String, String> mapToUpdate) {
    return _cloudManager.updateDeviceDocumentWithMap(deviceId, mapToUpdate);
  }

  static bool doesFirebaseAccountLogit(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    if (firebaseAccountsInformationD.fireBaseProjectId != null &&
        firebaseAccountsInformationD.fireBaseApiKey != null &&
        firebaseAccountsInformationD.userEmail != null &&
        firebaseAccountsInformationD.userPassword != null &&
        firebaseAccountsInformationD.homeId != null) {
      return true;
    }
    return false;
  }
}
