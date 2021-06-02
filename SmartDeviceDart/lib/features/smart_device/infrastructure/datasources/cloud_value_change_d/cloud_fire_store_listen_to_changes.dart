import 'package:firedart/firestore/models.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/core_d/fire_store/remote_data_base_controller.dart';

class CloudFireStoreListenToChangesD {
  CloudFireStoreListenToChangesD(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    firebaseAccountsInformationDCopy = firebaseAccountsInformationD;
    _dataBaseController =
        RemoteDataBaseController(firebaseAccountsInformationD);
  }

  static String dataPath = '/SmartHomes/';
  static String devicesPath = '/Devices';
  RemoteDataBaseController? _dataBaseController;
  FirebaseAccountsInformationD? firebaseAccountsInformationDCopy;

  Stream<Document?> listenToDocumentAndExecute() async* {
    final String devicesDataPath =
        dataPath + firebaseAccountsInformationDCopy!.homeId + devicesPath;
    yield* _dataBaseController!.listenToChangeOfDocumentInPath(devicesDataPath);
  }

  Stream<List<Document>> listenToCollectionAndExecute() async* {
    final String devicesDataPath =
        dataPath + firebaseAccountsInformationDCopy!.homeId + devicesPath;
    yield* _dataBaseController!
        .listenToChangeOfCollectionInPath(devicesDataPath);
  }

  Future<String> updateDocument(String fieldToUpdate, String valueToUpdate) {
    return _dataBaseController!
        .updateDocument(dataPath, fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocument(
      String deviceId, String fieldToUpdate, String valueToUpdate) {
    final String devicesDataPath =
        '$dataPath${firebaseAccountsInformationDCopy!.homeId}$devicesPath/$deviceId';

    return _dataBaseController!
        .updateDocument(devicesDataPath, fieldToUpdate, valueToUpdate);
  }

  Future<String> updateDeviceDocumentWithMap(
      String deviceId, Map<String, String> mapToUpdate) {
    final String devicesDataPath =
        '$dataPath${firebaseAccountsInformationDCopy!.homeId}$devicesPath/$deviceId';

    return _dataBaseController!
        .updateDocumentWithMap(devicesDataPath, mapToUpdate);
  }
}
