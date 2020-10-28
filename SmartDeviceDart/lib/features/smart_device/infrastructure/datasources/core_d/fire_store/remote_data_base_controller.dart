import 'dart:async';

import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/core_d/fire_store/cloud_fire_store_d.dart';
import 'package:firedart/firestore/models.dart';

class RemoteDataBaseController {

  RemoteDataBaseController(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudFireStoreNewD = CloudFireStoreD(firebaseAccountsInformationD);
  }

  CloudFireStoreD _cloudFireStoreNewD;

  ///  This method get data of field in the dataPath
  Future<String> getAllFieldsInPath(String dataPath) async {
    return _cloudFireStoreNewD.getData(dataPath);
  }

  ///  This method get data of field in the dataPath
  Future<String> getFieldInPath(String dataPath, String fieldName) async {
    return _cloudFireStoreNewD.getFieldInPath(dataPath, fieldName);
  }

  ///  For each data change in database it will return value
  Stream<Document> listenToChangeOfDataInPath(
      String dataPath) async* {
    yield* _cloudFireStoreNewD.listenToChangeOfDataInPath(dataPath);
  }

  String getValueOfLamp(Document document, String keyName) {
    return document[keyName].toString();
  }

  //  TODO: Write the code
  Future<String> setData(String dataPath, Object objectToInsert) async {
    return null;
  }

  Future<String> updateDocument(
      String dataPath, String fieldToUpdate, String valueToUpdate) {
    return _cloudFireStoreNewD.updateDataInBoolField(
        dataPath, fieldToUpdate, valueToUpdate);
  }
}
