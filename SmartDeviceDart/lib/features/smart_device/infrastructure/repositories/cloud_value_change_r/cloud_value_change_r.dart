import 'package:firedart/firestore/models.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/cloud_value_change_d/cloud_fire_store_listen_to_changes.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/cloud_value_change_r/cloud_value_change_r_abstract.dart';

class CloudManagerR extends CloudManagerRAbstract {
  CloudManagerR(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudFireStoreListenToChanges =
        CloudFireStoreListenToChangesD(firebaseAccountsInformationD);
  }

  CloudFireStoreListenToChangesD _cloudFireStoreListenToChanges;

  ///  Listen to changes in the database for this device
  Stream<Document> listenToDocumentInDataBase() async* {
    yield* _cloudFireStoreListenToChanges.listenToDocumentAndExecute();
  }

  Stream<List<Document>> listenToCollectionInDataBase() async* {
    yield* _cloudFireStoreListenToChanges.listenToCollectionAndExecute();
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _cloudFireStoreListenToChanges.updateDocument(
        fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocument(
      String deviceId, String fieldToUpdate, String valueToUpdate) {
    return _cloudFireStoreListenToChanges.updateDeviceDocument(
        deviceId, fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocumentWithMap(
      String deviceId, Map<String, String> mapToUpdate) {
    return _cloudFireStoreListenToChanges.updateDeviceDocumentWithMap(
        deviceId, mapToUpdate);
  }
}
