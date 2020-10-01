import 'package:firedart/firestore/models.dart';

import '../../datasources/accounts_information_d/accounts_information_d.dart';
import '../../datasources/cloud_value_change_d/cloud_fire_store_listen_to_changes.dart';
import 'cloud_value_change_r_abstract.dart';

class CloudManagerR extends CloudManagerRAbstract {
  CloudFireStoreListenToChangesD _cloudFireStoreListenToChanges;

  CloudManagerR(FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _cloudFireStoreListenToChanges =
        CloudFireStoreListenToChangesD(firebaseAccountsInformationD);
  }

  //  Listen to changes in the database for this device
  Stream<Document> listenToDataBase() async* {
    yield* _cloudFireStoreListenToChanges.listenAndExecute();
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _cloudFireStoreListenToChanges.updateDocument(
        fieldToUpdate, valueToUpdate);
  }
}
