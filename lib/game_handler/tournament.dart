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
    gameTypeInit(initStart);
    sendInitStat(wc);
  }
  void sendInitStat(WebSocketChannel wc) {
    InitStartStat initStartStat = InitStartStat(
        playerId: _data.currentPlayerId, tournamentId: _tournamentId);
    print("ServerSending Data");
    GameMessageServer gms = GameMessageServer();
    gms.initStartStat = initStartStat;
    wc.sink.add(gms.writeToBuffer());
  }

  void gameTypeInit(InitStart initStart) {}
}

class RummyTournament extends Tournament {
  //late RummyTournamentData _data;
  RummyTournament(InitStart initStart, WebSocketChannel wc, int tournamentId)
      : super(initStart, wc, tournamentId);
  @override
  void gameTypeInit(InitStart initStart) {
    _data.rummyData = RummyTournamentData(state: RummyState.INIT);
  }
}
