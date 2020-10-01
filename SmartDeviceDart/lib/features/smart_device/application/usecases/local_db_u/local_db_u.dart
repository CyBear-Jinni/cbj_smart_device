import '../../../domain/entities/local_db_e/local_db_e.dart';
import '../../../infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import '../smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';

class LocalDbU {
  LocalDbE _localDbE;

  LocalDbU() {
    _localDbE = LocalDbE();
  }

  Future<List<SmartDeviceBaseAbstract>> getListOfSmartDevices() async {
    return await _localDbE.getListOfSmartDevices();
  }

  Future<FirebaseAccountsInformationD> getListOfDatabaseInformation() async {
    return await _localDbE.getListOfDatabaseInformation();
  }
}
