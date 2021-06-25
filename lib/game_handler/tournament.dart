import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/proto/tournament_data.pbserver.dart';

class Tournament {
  late TournamentData _data;
  Tournament(InitStart initStart) {
    initTournament(initStart);
  }
  void initTournament(InitStart initStart) {
    _data = TournamentData(
      noOfDeck: initStart.noOfDeck,
      noOfPlayers: initStart.noOfPlayers,
      noOfRounds: initStart.noOfRounds,
      trophyId: initStart.trophyId,
      tournamentName: initStart.tournamentName,
    );
    _data.players.add(initStart.playerName);
    _data.currentPlayerId = 0;
    gameTypeInit(initStart);
  }

  void gameTypeInit(InitStart initStart) {}
}

class RummyTournament extends Tournament {
  //late RummyTournamentData _data;
  RummyTournament(InitStart initStart) : super(initStart);
  @override
  void gameTypeInit(InitStart initStart) {
    _data.rummyData = RummyTournamentData(state: RummyState.INIT);
  }
}
