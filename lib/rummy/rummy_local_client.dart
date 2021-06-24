import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class RummyLocalClient {
  late WebSocketChannel _channel;
  final ValueChanged<bool> onConnected;
  /*
  WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080'),
  );
  */

  String _type = '_rooster-service._tcp';
  late BonsoirDiscovery _discovery;

  WebSocketChannel get channel => _channel;
  RummyLocalClient({required this.onConnected}) {
    _initDiscovery();
  }
  void _initDiscovery() async {
    _discovery = BonsoirDiscovery(type: _type);
    await _discovery.ready;
    await _discovery.start();
    //await _discovery.eventStream?.forEach((event) {
    // If you want to listen to the discovery :
    _discovery.eventStream?.listen((event) {
      // await for (BonsoirDiscoveryEvent event in  _discovery.eventStream) {

      if (event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED) {
        var serviceData = event.service?.toJson();
        print('Service found : $serviceData');
        var host = (serviceData ?? const {})['service.ip'] ?? "localhost";
        var port = (serviceData ?? const {})['service.port'] ?? "8080";

        connectToServer(host.toString(), port.toString());
        onConnected(true);
      } else if (event.type ==
          BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST) {
        print('Service lost : ${event.service?.toJson()}');
      }
    });
  }

  void connectToServer(String host, String port) {
    print("connecting $host:$port");
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://' + host + ':' + port),
      //Uri.parse('ws://localhost:8080'),
    );

    //print(_channel.stream);
  }

  void dispose() async {
    await _discovery.stop();
    await _channel.sink.close();
  }

  void sendMessage(dynamic data) {
    print(data);
    _channel.sink.add(data);
  }
}
