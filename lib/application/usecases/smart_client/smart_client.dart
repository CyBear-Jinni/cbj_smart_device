import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class SmartClient {
  static ClientChannel? channel;
  static SmartServerClient? stub;

  ///  Turn smart device on
  static Future<void> createStreamWithClients(String addressToHub) async {
    channel = await createSmartServerClient(addressToHub);
    stub = SmartServerClient(channel!);
    ResponseStream<ClientStatusRequests> response;
    final Stream<RequestsAndStatusFromHub> streamClientStatusRequests =
        Stream.value(RequestsAndStatusFromHub());
    try {
      response = stub!.registerHub(streamClientStatusRequests);
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

  static Future<ClientChannel> createSmartServerClient(String deviceIp) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: 50053,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
