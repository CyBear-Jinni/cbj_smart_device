import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

/// Cleaner way to get grpc client types
class GrpcClientTypes {
  /// CbjDeviceStateGRPC type
  static final CbjDeviceStateGRPCType =
      CbjDeviceStateGRPC.stateNotSupported.runtimeType;

  /// CbjDeviceStateGRPC type as string
  static final CbjDeviceStateGRPCTypeString =
      CbjDeviceStateGRPCType.toString().substring(0, 1).toLowerCase() +
          CbjDeviceStateGRPCType.toString().substring(1);

  /// CbjDeviceActions type as string
  static final CbjDeviceActionsType =
      CbjDeviceActions.actionNotSupported.runtimeType;

  /// CbjDeviceActions type as string
  static final CbjDeviceActionsTypeString =
      CbjDeviceActionsType.toString().substring(0, 1).toLowerCase() +
          CbjDeviceActionsType.toString().substring(1);

  /// CbjDeviceActions type as string
  static final CbjDeviceTypesType = CbjDeviceTypes.typeNotSupported.runtimeType;

  /// CbjDeviceActions type as string
  static final CbjDeviceTypesTypeString =
      CbjDeviceTypesType.toString().substring(0, 1).toLowerCase() +
          CbjDeviceTypesType.toString().substring(1);
}
