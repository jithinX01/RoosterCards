import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/proto/tournament_data.pbserver.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Tournament {
  late TournamentData _data;
  late int _tournamentId;
  int _joinedPlayers = 0;
  var playerConnections = Map<int, WebSocketChannel>();

  Tournament(InitStart initStart, WebSocketChannel wc, int tournamentId) {
    _data = TournamentData(
      noOfDeck: initStart.noOfDeck,
      noOfPlayers: initStart.noOfPlayers,
      noOfRounds: initStart.noOfRounds,
      trophyId: initStart.trophyId,
      tournamentName: initStart.tournamentName,
    );
    _data.players.add(initStart.playerName);
    _data.currentPlayerId = _joinedPlayers;
    playerConnections[_joinedPlayers] = wc;
    ++_joinedPlayers;
    _tournamentId = tournamentId;
    _gameTypeInit(initStart);
    _sendInitStat(wc);
  }
  void _sendInitStat(WebSocketChannel wc) {
    InitStartStat initStartStat = InitStartStat(
        playerId: _data.currentPlayerId, tournamentId: _tournamentId);
    print("ServerSending Data");
    GameMessageServer gms = GameMessageServer();
    gms.initStartStat = initStartStat;
    wc.sink.add(gms.writeToBuffer());
  }

  //overrided in derived class
  void _gameTypeInit(InitStart initStart) {}

  void handleJoin(Join join, WebSocketChannel wc) {
    _data.players.add(join.playerName);
    int connectedPlayerId = _joinedPlayers;
    playerConnections[connectedPlayerId] = wc;
    ++_joinedPlayers;
    _sendJoinStat(wc, connectedPlayerId);
    if (_joinedPlayers == _data.noOfPlayers) {
      //Start Tournament.
      //Send status to all players.
    } else {
      //Send Join Progress
      _sendJoinProgress(connectedPlayerId);
    }
  }

  void _sendJoinProgress(int connectedPlayerId) {
    GameMessageServer gms = GameMessageServer(
        joinProgress: JoinProgress(players: _data.players.skipWhile((value) {
      return _data.players.indexOf(value) == connectedPlayerId;
    })));
    playerConnections.forEach((key, value) {
      value.sink.add(gms.writeToBuffer());
    });
  }

  void _sendJoinStat(WebSocketChannel wc, int connectedPlayerId) {
    GameMessageServer gms =
        GameMessageServer(joinStat: JoinStat(playerId: connectedPlayerId));
    wc.sink.add(gms.writeToBuffer());
  }
}

class RummyTournament extends Tournament {
  //late RummyTournamentData _data;
  RummyTournament(InitStart initStart, WebSocketChannel wc, int tournamentId)
      : super(initStart, wc, tournamentId);
  @override
  void _gameTypeInit(InitStart initStart) {
    _data.rummyData = RummyTournamentData(state: RummyState.INIT);
  }
}
