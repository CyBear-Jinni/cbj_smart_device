import 'package:firedart/firestore/models.dart';

import '../accounts_information_d/accounts_information_d.dart';
import '../core_d/fire_store/remote_data_base_controller.dart';

class CloudFireStoreListenToChangesD {
  String dataPath = '/SmartHomes/GuyHome/Devices/Lights';
  RemoteDataBaseController _dataBaseController;

  CloudFireStoreListenToChangesD(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    _dataBaseController =
        RemoteDataBaseController(firebaseAccountsInformationD);
  }

  Stream<Document> listenAndExecute() async* {
    yield* _dataBaseController.listenToChangeOfDataInPath(dataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _dataBaseController.updateDocument(
        dataPath, fieldToUpdate, valueToUpdate);
  }
}
