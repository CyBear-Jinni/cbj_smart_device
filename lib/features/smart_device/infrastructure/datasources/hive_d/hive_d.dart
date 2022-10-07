import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/hive_d/hive_objects_d/hive_devices_d.dart';
import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/system_commands_d/system_commands_manager_d.dart';
import 'package:hive/hive.dart';

class HiveD {
  factory HiveD() {
    return _instance;
  }

  HiveD._privateConstructor() {
//    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  String? hiveFolderPath;
  static bool? finishedInitializing;
  static const String smartDeviceBoxName = 'SmartDevices';
  static const String cellDeviceListInSmartDeviceBox = 'deviceList';
  static const String cellDatabaseInformationInSmartDeviceBox =
      'databaseInformation';

  Future<bool?> contractorAsync() async {
    try {
      if (finishedInitializing == null) {
        final String? snapCommonEnvironmentVariablePath =
            await SystemCommandsManager().getSnapCommonEnvironmentVariable();
        if (snapCommonEnvironmentVariablePath == null) {
          final String? currentUserName =
              await MySingleton.getCurrentUserName();
          hiveFolderPath = '/home/$currentUserName/Documents/hive';
        } else {
          // /var/snap/cybear-jinni/common/hive
          hiveFolderPath = '$snapCommonEnvironmentVariablePath/hive';
        }
        print('Path of hive: $hiveFolderPath');
        Hive.init(hiveFolderPath!);

        //
        // Hive.openBox(
        //     smartDeviceBoxName); // TODO: check if need await, it creates error: HiveError: Cannot read, unknown typeId: 34
        // Hive.registerAdapter(TokenAdapter());
        Hive.registerAdapter(HiveDevicesDAdapter());

        finishedInitializing = true;
      }
    } catch (error) {
      print('error: $error');
    }
    return finishedInitializing;
  }

  Future<Map<String, List<String?>>?> getListOfSmartDevices() async {
    try {
      await contractorAsync();

      final box = await Hive.openBox(smartDeviceBoxName);

      final HiveDevicesD? hiveDeviceD =
          box.get(cellDeviceListInSmartDeviceBox) as HiveDevicesD?;

      return hiveDeviceD?.smartDeviceList;
    } catch (error) {
      print('error: $error');
    }
    return null;
  }

  Future<Map<String, String?>?> getListOfDatabaseInformation() async {
    try {
      await contractorAsync();

      final box = await Hive.openBox(smartDeviceBoxName);

      final HiveDevicesD? firebaseAccountsInformationMap =
          box.get(cellDatabaseInformationInSmartDeviceBox) as HiveDevicesD?;

      return firebaseAccountsInformationMap?.databaseInformationList;
    } catch (error) {
      print('error: $error');
    }
    return null;
  }

  Future<void> saveAllDevices(
    Map<String, List<String?>> smartDevicesMapList,
  ) async {
    try {
      final Map<String, List<String>> smartDevicesMapListWithoutNull =
          smartDevicesMapList.map((key, value) {
        final List<String> valueList = value.map((e) => e ?? '').toList();
        return MapEntry(key, valueList);
      });

      await contractorAsync();

      final Box box = await Hive.openBox(smartDeviceBoxName);

      final HiveDevicesD hiveDevicesD = HiveDevicesD()
        ..smartDeviceList = smartDevicesMapListWithoutNull;

      await box
          .put(cellDeviceListInSmartDeviceBox, hiveDevicesD)
          .catchError((a) {
        print('Error is: $a');
      });
    } catch (error) {
      print('error: $error');
    }
    return;
  }

  Future<void> saveListOfDatabaseInformation(
    Map<String, String> firebaseAccountsInformationMap,
  ) async {
    try {
      await contractorAsync();

      final box = await Hive.openBox(smartDeviceBoxName);

      final HiveDevicesD hiveDevicesD = HiveDevicesD()
        ..databaseInformationList = firebaseAccountsInformationMap;

      await box.put(cellDatabaseInformationInSmartDeviceBox, hiveDevicesD);
    } catch (error) {
      print('error: $error');
    }
    return;
  }
}
