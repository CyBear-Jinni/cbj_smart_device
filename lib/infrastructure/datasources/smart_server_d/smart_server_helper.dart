import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

/// Cleaner way to get grpc client types
class GrpcClientTypes {
  /// DeviceStateGRPC type
  static final deviceStateGRPCType =
      DeviceStateGRPC.stateNotSupported.runtimeType;

  /// DeviceStateGRPC type as string
  static final deviceStateGRPCTypeString =
      deviceStateGRPCType.toString().substring(0, 1).toLowerCase() +
          deviceStateGRPCType.toString().substring(1);

  /// DeviceActions type as string
  static final deviceActionsType = DeviceActions.actionNotSupported.runtimeType;

  /// DeviceActions type as string
  static final deviceActionsTypeString =
      deviceActionsType.toString().substring(0, 1).toLowerCase() +
          deviceActionsType.toString().substring(1);

  /// DeviceActions type as string
  static final deviceTypesType = DeviceTypes.typeNotSupported.runtimeType;

  /// DeviceActions type as string
  static final deviceTypesTypeString =
      deviceTypesType.toString().substring(0, 1).toLowerCase() +
          deviceTypesType.toString().substring(1);
}
