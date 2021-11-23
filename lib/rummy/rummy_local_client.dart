import 'dart:io';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class RummyLocalClient {
  late WebSocketChannel _channel;
  final ValueChanged<bool> onConnected;
  String _type = '_rooster-service._tcp';
  late BonsoirDiscovery _discovery;
  bool initDiscovery = true;

  WebSocketChannel get channel => _channel;
  RummyLocalClient({required this.onConnected, this.initDiscovery = true}) {
    if (initDiscovery) {
      _initDiscovery();
    } else {
      //to test locally
      connectToServer("0.0.0.0", "8080");
      //for testing with emulators.
      //telnet localhost 5554
      //auth <token>
      //redir add tcp:8080:8080
      //uncomment below.
      //connectToServer("10.0.2.2", "8080");

      //onConnected(true);
    }
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
        //rprint('Service found : $serviceData');
        var host = (serviceData ?? const {})['service.ip'] ?? "localhost";
        var port = (serviceData ?? const {})['service.port'] ?? "8080";

        connectToServer(host.toString(), port.toString());
        onConnected(true);
      } else if (event.type ==
          BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST) {
        //rprint('Service lost : ${event.service?.toJson()}');
      }
    });
  }

  void connectToServer(String host, String port) {
    //rprint("connecting $host:$port");
    HttpOverrides.runWithHttpOverrides((){
      _channel = WebSocketChannel.connect(
      Uri.parse('wss://' + host + ':' + port),
      //Uri.parse('ws://localhost:8080'),
      );
    }, MyHttpOverrides());
    /*
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://' + host + ':' + port),
      //Uri.parse('ws://localhost:8080'),
    );
    */

    //rprint(_channel);
    onConnected(true);
  }

  void dispose() async {
    if (initDiscovery) await _discovery.stop();
    await _channel.sink.close();
  }

  void sendMessage(dynamic data) {
    //rprint(data);
    _channel.sink.add(data);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port){
            /* 
            print("Bad Cert $host");
            print(cert.subject);
            print(cert.issuer);
            print(cert.sha1.toString());
            */
            return cert.subject.contains("CN=rooster.local") && cert.issuer.contains("CN=rooster.local"); 
            }; // add your localhost detection logic here if you want
  }
}


