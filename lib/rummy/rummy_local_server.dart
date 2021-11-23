import 'dart:io';

//import 'package:rooster_cards/rummy/tournament_settings.dart';
import 'package:flutter/services.dart';
import 'package:rooster_cards/game_handler/game_handler.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:bonsoir/bonsoir.dart';

void main() {}

class RummyLocalServer {
  /*
  TournamentSettings _ts;
  set tournamentSetting(TournamentSettings ts) {
    _ts = ts;
  }
  */
  GameHandler _gameHandler = GameHandler();

  BonsoirService _service = BonsoirService(
    name: 'RoosterService', // Put your service name here.
    type:
        '_rooster-service._tcp', // Put your service type here. Syntax : _ServiceType._TransportProtocolName. (see http://wiki.ros.org/zeroconf/Tutorials/Understanding%20Zeroconf%20Service%20Types).
    port: 8080, // Put your service port here.
  );
  late BonsoirBroadcast _broadcast;

  late HttpServer _server;
  var _handler;
  List<WebSocketChannel> _clients = [];

  RummyLocalServer() {
    /*
    _initServer();
    _startDiscovery();
    */
  }

  Future<void> _startDiscovery() async {
    _broadcast = BonsoirBroadcast(service: _service);
    await _broadcast.ready;
    await _broadcast.start();
  }

  void dispose() async {
    await _broadcast.stop();
    await _server.close();
  }
  Future<void> init() async
  {
    await _initServer();
    await _startDiscovery();
  }
  Future<void> _initServer() async {
    var handler = webSocketHandler((webSocket) {
      //rprint(webSocket.hashCode);
      //print(webSocket.closeCode);
      _clients.add(webSocket);
      //rprint(_clients.length);
      webSocket.stream.listen((dynamic message) {
        //rprint(message);
        _gameHandler.handleMessage(message, webSocket);
        //webSocket.sink.add("echo $message");
      }, onDone: () {
        //rprint("ws channel closed");
        _clients.remove(webSocket);
        _gameHandler.handleWSDone(webSocket);
        //rprint("websocket closed");
      }, onError: (error) {
        //rprint("Error");
      });
    });

    _handler = handler;
    SecurityContext context = SecurityContext.defaultContext;
    var cert = await rootBundle.load("ssl/server.cert");
    var key =  await rootBundle.load("ssl/server.key");
    context.useCertificateChainBytes(cert.buffer.asInt8List());
    context.usePrivateKeyBytes(key.buffer.asInt8List());
    //rprint("Starting Server");
    await shelf_io.serve(_handler, '0.0.0.0', 8080, securityContext: context).then((server) {
      _server = server;
      //rprint('Serving at wss://${server.address.host}:${server.port}');
    });
  }
}
