import 'package:SmartDeviceDart/core/my_singleton.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/hive_devices_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/hive_d/hive_store_d.dart';
import 'package:SmartDeviceDart/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:hive/hive.dart';

class HiveD {
  factory HiveD() {
    return _instance;
  }

  HiveD._privateConstructor() {
//    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  String hiveFolderPath;
  static bool finishedInitializing;
  static const String smartDeviceBoxName = 'SmartDevices';
  static const String cellDeviceListInSmartDeviceBox = 'deviceList';
  static const String cellDatabaseInformationInSmartDeviceBox =
      'databaseInformation';

  Future<bool> contractorAsync() async {
    if (finishedInitializing == null) {
      String snapCommonEnvironmentVariablePath =
          await SystemCommandsManager().getSnapCommonEnvironmentVariable();
      if (snapCommonEnvironmentVariablePath == null) {
        final String currentUserName = await MySingleton.getCurrentUserName();
        hiveFolderPath = '/home/$currentUserName/Documents/hive';
      } else {
        hiveFolderPath = '$snapCommonEnvironmentVariablePath/hive';
      }
      print('Path of hive: ' + hiveFolderPath);
      Hive.init(hiveFolderPath);

      Hive.openBox(
          smartDeviceBoxName); // TODO: check if need await, it creates error: HiveError: Cannot read, unknown typeId: 34
      Hive.registerAdapter(TokenAdapter());
      Hive.registerAdapter(HiveDevicesDAdapter());

      finishedInitializing = true;
    }
    return finishedInitializing;
  }

  Future<Map<String, List<String>>> getListOfSmartDevices() async {
    await contractorAsync();

    var box = await Hive.openBox(smartDeviceBoxName);

    HiveDevicesD a = box.get(cellDeviceListInSmartDeviceBox) as HiveDevicesD;

    return a?.smartDeviceList;
  }

  Future<Map<String, String>> getListOfDatabaseInformation() async {
    await contractorAsync();

    var box = await Hive.openBox(smartDeviceBoxName);

    HiveDevicesD firebaseAccountsInformationMap =
    box.get(cellDatabaseInformationInSmartDeviceBox) as HiveDevicesD;

    return firebaseAccountsInformationMap?.databaseInformationList;
  }

  Future<void> saveAllDevices(Map<String, List<String>> smartDevicesMapList) async {
    await finishedInitializing;

    var box = await Hive.openBox(smartDeviceBoxName);

    final HiveDevicesD hiveDevicesD = HiveDevicesD()
      ..smartDeviceList = smartDevicesMapList;

    await box.put(cellDeviceListInSmartDeviceBox, hiveDevicesD);
  }

  Future<void> saveListOfDatabaseInformation(Map<String, String> firebaseAccountsInformationMap) async {
    await finishedInitializing;

    var box = await Hive.openBox(smartDeviceBoxName);

    final HiveDevicesD hiveDevicesD = HiveDevicesD()
      ..databaseInformationList = firebaseAccountsInformationMap;

    await box.put(cellDatabaseInformationInSmartDeviceBox, hiveDevicesD);
  }
}
