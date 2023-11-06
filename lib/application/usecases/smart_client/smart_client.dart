import 'package:cbj_integrations_controller/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:grpc/grpc.dart';

class SmartClient {
  static ClientChannel? channel;
  static CbjSmartDeviceConnectionsClient? stub;

  ///  Turn smart device on
  static Future<void> createStreamWithClients(String addressToHub) async {
    channel = await createCbjSmartDeviceServerClient(addressToHub);
    stub = CbjSmartDeviceConnectionsClient(channel!);
    ResponseStream<CbjClientStatusRequests> response;
    final Stream<CbjRequestsAndStatusFromHub> streamCbjClientStatusRequests =
        Stream.value(CbjRequestsAndStatusFromHub());
    try {
      response = stub!.registerHub(streamCbjClientStatusRequests);
      response.listen((value) {
        print('Greeter client received: $value');
      });
// await channel!.shutdown();
// return response.success.toString();
    } catch (e) {
      print('Caught error: $e');
    }
// await channel!.shutdown();
// throw 'Error';
  }

  static Future<ClientChannel> createCbjSmartDeviceServerClient(
    String deviceIp,
  ) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: CbjSmartDeviceServerU.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
