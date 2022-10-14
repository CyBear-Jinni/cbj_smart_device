import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
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
      port: 50054,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
