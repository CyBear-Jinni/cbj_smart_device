import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:smart_device_dart/core/my_singleton.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/cloud_value_change_u/cloud_value_change_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/core_u/actions_to_preform_u.dart';
import 'package:smart_device_dart/features/smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/core_e/enums_e.dart';
import 'package:smart_device_dart/features/smart_device/domain/entities/local_db_e/local_db_e.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:smart_device_dart/features/smart_device/infrastructure/repositories/core_r/my_singleton_helper.dart';
import 'package:uuid/uuid.dart';

/// This class get what to execute straight from the grpc request,
class SmartServerU extends SmartServerServiceBase {
  static const DeviceStateGRPC _deviceState = DeviceStateGRPC.waitingInFirebase;

  ///  Listening to port and deciding what to do with the response
  void waitForConnection(
      FirebaseAccountsInformationD firebaseAccountsInformationD) {
    print('Wait for connection');

    final SmartServerU smartServer = SmartServerU();
    smartServer.startListen(
        firebaseAccountsInformationD); // Will go throw the model with the
    // grpc logic and converter to objects
  }

  ///  Listening in the background to incoming connections
  Future startListen(
      FirebaseAccountsInformationD firebaseAccountsInformationD) async {
    startListenToDb(firebaseAccountsInformationD);
    await startLocalServer();
  }

  void startListenToDb(
      FirebaseAccountsInformationD firebaseAccountInformationD) {
    if (firebaseAccountInformationD == null) {
      print('Database var databaseInformationFromDb is null');
      return;
    }

    if (firebaseAccountInformationD.areAllValuesNotNull()) {
      final CloudValueChangeU cloudValueChangeUseCases =
          CloudValueChangeU(firebaseAccountInformationD);
      cloudValueChangeUseCases.listenToDataBase(); //  Listen to changes in the
      // database for this device
    }
  }

  Future startLocalServer() async {
    final server = Server([SmartServerU()]);
    await server.serve(port: 50051);
    print('Server listening on port ${server.port}...');
  }

  @override
  Future<CompInfo> getCompInfo(ServiceCall call, CommendStatus request) async {
    final String compId = Uuid().v1();
    final String compUuid = await MySingletonHelper.getUuid();
    final List<SmartDeviceBaseAbstract> devicesList =
        MySingleton.getSmartDevicesList();

    final CompSpecs compSpecs = CompSpecs(
      compId: compId,
      compUuid: compUuid,
    );

    final List<SmartDeviceInfo> smartDeviceInfoList = [];
    devicesList.forEach((element) {
      DeviceTypes deviceTypes;
      switch (element.getDeviceType()) {
        case DeviceType.Light:
          deviceTypes = DeviceTypes.Light;
          break;
        case DeviceType.DynamicLight:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Blinds:
          deviceTypes = DeviceTypes.Blinds;
          break;
        case DeviceType.Thermostat:
          deviceTypes = DeviceTypes.Thermostat;
          break;
        case DeviceType.Fan:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.AirConditioner:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Camera:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Fridge:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Toaster:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.CoffeeMachine:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.SmartTV:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.RCAirplane:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.RCCar:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Speakers:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Roomba:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.Irrigation:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.SmartBed:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.AnimalTracker:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
        case DeviceType.SmartCar:
          deviceTypes = DeviceTypes.TypeNotSupported;
          break;
      }
      final DeviceTypesActions deviceTypesActions = DeviceTypesActions(
        deviceType: deviceTypes,
        deviceAction:
            element.getDeviceState() ? DeviceActions.On : DeviceActions.Off,
        deviceStateGRPC: DeviceStateGRPC.waitingInComp,
      );

      final SmartDeviceInfo smartDeviceInfo = SmartDeviceInfo(
        id: element.id,
        senderId: compId,
        deviceTypesActions: deviceTypesActions,
        compSpecs: compSpecs,
        defaultName: element.deviceInformation.getName(),
      );
      smartDeviceInfoList.add(smartDeviceInfo);
    });

    final CompInfo compInfo =
        CompInfo(compSpecs: compSpecs, smartDevicesInComp: smartDeviceInfoList);

    return Future<CompInfo>.value(compInfo);
  }

  //  Return the status of the specified device
  @override
  Future<SmartDeviceStatus> getStatus(
      ServiceCall call, SmartDeviceInfo request) async {
    final String deviceStatus = await executeDeviceActionString(
        request, DeviceActions.ActionNotSupported, _deviceState);

    print(
        'Getting status of device $request and device status in bool $deviceStatus');
    return SmartDeviceStatus()..onOffState = deviceStatus == 'true';
  }

  @override
  Future<CommendStatus> updateDeviceName(
      ServiceCall call, SmartDeviceUpdateDetails request) async {
    print(
        'Updating device name:${request.smartDevice.id} into: ${request.newName}');
    final SmartDeviceBaseAbstract smartDevice =
        getSmartDeviceBaseAbstract(request.smartDevice);
    smartDevice.id = request.newName;
    final CommendStatus commendStatus = CommendStatus();
    commendStatus.success = true;
    final LocalDbE localDbE = LocalDbE();
    await localDbE.saveAllDevices(MySingleton.getSmartDevicesList());
    return Future<CommendStatus>.value(commendStatus);
  }

  @override
  Future<CommendStatus> setOffDevice(
      ServiceCall call, SmartDeviceInfo request) async {
    print('Turn device ${request.id} off');
    return executeDeviceActionServer(request, DeviceActions.Off, _deviceState);
  }

  @override
  Future<CommendStatus> setOnDevice(
      ServiceCall call, SmartDeviceInfo request) async {
    print('Turn device ${request.id} on');
    return executeDeviceActionServer(request, DeviceActions.On, _deviceState);
  }

  @override
  Future<CommendStatus> setBlindsUp(
      ServiceCall call, SmartDeviceInfo request) async {
    print('Turn blinds ${request.id} up');
    return executeDeviceActionServer(
        request, DeviceActions.MoveUP, _deviceState);
  }

  @override
  Future<CommendStatus> setBlindsDown(
      ServiceCall call, SmartDeviceInfo request) async {
    print('Turn blinds ${request.id} down');

    return executeDeviceActionServer(
        request, DeviceActions.MoveDon, _deviceState);
  }

  @override
  Future<CommendStatus> setBlindsStop(
      ServiceCall call, SmartDeviceInfo request) async {
    print('Turn blinds ${request.id} stop');

    return executeDeviceActionServer(request, DeviceActions.Stop, _deviceState);
  }

  SmartDeviceBaseAbstract getSmartDeviceBaseAbstract(SmartDeviceInfo request) {
    try {
      return MySingleton.getSmartDevicesList().firstWhere(
          (smartDeviceBaseAbstractO) =>
              smartDeviceBaseAbstractO.id == request.id);
    } catch (exception) {
      print('Exception, device name ${request.id} could not be found:'
          ' ${exception.message}');
      return null;
    }
  }

  CommendStatus executeDeviceActionServer(SmartDeviceInfo request,
      DeviceActions deviceAction, DeviceStateGRPC _deviceState) {
    final SmartDeviceBaseAbstract smartDevice =
        getSmartDeviceBaseAbstract(request);
    if (smartDevice == null) {
      return CommendStatus()..success = false;
    }
    ActionsToPreformU.executeDeviceAction(
        smartDevice, deviceAction, _deviceState);
    return CommendStatus()..success = smartDevice.onOff;
  }

  Future<String> executeDeviceActionString(SmartDeviceInfo request,
      DeviceActions deviceAction, DeviceStateGRPC deviceState) async {
    final SmartDeviceBaseAbstract smartDevice =
        getSmartDeviceBaseAbstract(request);
    if (smartDevice == null) {
      return 'SmartDevice is null in execute DeviceActions String';
    }
    return ActionsToPreformU.executeDeviceAction(
        smartDevice, deviceAction, deviceState);
  }

  @override
  Future<CommendStatus> setFirebaseAccountInformation(
      ServiceCall call, FirebaseAccountInformation request) async {
    print('This is the function setFirebaseAccountInformation');
    final CommendStatus commendStatus =
        await setFirebaseAccountInformationHelper(request);

    return Future<CommendStatus>.value(commendStatus);
  }

  @override
  Future<CommendStatus> setCompInfo(ServiceCall call, CompInfo request) async {
    return SetCompHelper(request);
  }

  @override
  Future<CommendStatus> firstSetup(
      ServiceCall call, FirstSetupMessage request) async {
    try {
      final CompInfo compInfo = request.compInfo;
      final CommendStatus commendStatusSetComp = await SetCompHelper(compInfo);

      final CommendStatus commendStatusSetFirebase =
          await setFirebaseAccountInformationHelper(
              request.firebaseAccountInformation);

      if (commendStatusSetComp.success && commendStatusSetFirebase.success) {
        return CommendStatus()..success = true;
      }
    } catch (e) {}

    return CommendStatus()..success = false;
  }

  Future<CommendStatus> SetCompHelper(CompInfo compInfo) async {
    try {
      final List<SmartDeviceBaseAbstract> smartDeviceList =
          MySingleton.getSmartDevicesList();

      for (final SmartDeviceBaseAbstract smartDevice in smartDeviceList) {
        for (final SmartDeviceInfo smartDeviceInfo
            in compInfo.smartDevicesInComp) {
          if (smartDevice.id == smartDeviceInfo.id) {
            smartDevice.deviceInformation.setName(smartDeviceInfo.defaultName);
            break;
          }
        }
      }

      final LocalDbE localDbE = LocalDbE();
      await localDbE.saveAllDevices(MySingleton.getSmartDevicesList());

      return CommendStatus()..success = true;
    } catch (e) {
      return CommendStatus()..success = false;
    }
  }

  Future<CommendStatus> setFirebaseAccountInformationHelper(
      FirebaseAccountInformation request) async {
    try {
      final FirebaseAccountsInformationD firebaseAccountsInformationD =
          FirebaseAccountsInformationD(
              request.fireBaseProjectId,
              request.fireBaseApiKey,
              request.userEmail,
              request.userPassword,
              request.homeId);

      final CloudValueChangeU cloudValueChangeU =
          CloudValueChangeU(firebaseAccountsInformationD);

      cloudValueChangeU.setNewFirebaseAccounInfo(firebaseAccountsInformationD);

      for (final SmartDeviceBaseAbstract device
          in MySingleton.getSmartDevicesList()) {
        if (device.getDeviceType() == DeviceType.Light) {
          final Map<String, String> dataToChange = {
            'state': DeviceStateGRPC.ack.toString(),
          };

          final String createDeviceInHomeSuccess = await cloudValueChangeU
              .updateDeviceDocumentWithMap(device.id, dataToChange);
          if (createDeviceInHomeSuccess.toLowerCase().contains('error')) {
            return CommendStatus()..success = false;
          }
        }
      }

      final LocalDbE localDbE = LocalDbE();
      localDbE.saveListOfDatabaseInformation(firebaseAccountsInformationD);

      startListenToDb(firebaseAccountsInformationD);

      return CommendStatus()..success = true;
    } catch (e) {
      return CommendStatus()..success = false;
    }
  }
}
