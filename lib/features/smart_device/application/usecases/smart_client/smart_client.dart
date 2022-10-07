import 'package:cbj_smart_device/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart/smart_connection.pbgrpc.dart';
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
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
