import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/proto/tournament_data.pbserver.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const NO_OF_CARDS = 53;
const NO_OF_RUMMY_CARDS = 13;

class Tournament {
  late TournamentData _data;
  //late int _tournamentId;
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
    _data.tournamentId = tournamentId;
    _gameTypeInit(initStart);
    _sendInitStat(wc);
  }
  void _sendInitStat(WebSocketChannel wc) {
    InitStartStat initStartStat = InitStartStat(
        playerId: _data.currentPlayerId, tournamentId: _data.tournamentId);
    print("ServerSending Data");
    GameMessageServer gms = GameMessageServer();
    gms.initStartStat = initStartStat;
    wc.sink.add(gms.writeToBuffer());
  }

  //overrided in derived class
  void _gameTypeInit(InitStart initStart) {}
  void _startTournament() {}

  void handleJoin(Join join, WebSocketChannel wc) {
    _data.players.add(join.playerName);
    int connectedPlayerId = _joinedPlayers;
    playerConnections[connectedPlayerId] = wc;
    ++_joinedPlayers;
    _sendJoinStat(wc, connectedPlayerId);
    if (_joinedPlayers == _data.noOfPlayers) {
      //Start Tournament.
      _startTournament();
      //Send status to all players.
      _sendStartTournament();
    } else {
      //Send Join Progress
      _sendJoinProgress(connectedPlayerId);
    }
  }

  void handleClientGameStat(
      ClientGameStat clientGameStat, WebSocketChannel wc) {}

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

  void _sendStartTournament() {
    _data.nextCard = _data.cardStack[0];
    playerConnections.forEach((key, channel) {
      //value.sink.add(gms.writeToBuffer());
      GameMessageServer gms = GameMessageServer(
          startTournament: StartTournament(
        playerMap: _data.players.asMap(),
        cards: _data.playerCards[key]?.cards,
        youStart: _data.currentPlayerId == key,
        activePlayerId: _data.currentPlayerId,
        round: _data.currentRound,
        tournamentName: _data.tournamentName,
        trophyId: _data.trophyId,
        yourId: key,
        nextCard: _data.currentPlayerId == key ? _data.cardStack[0] : -1,
        tournamentId: _data.tournamentId,
      ));
      channel.sink.add(gms.writeToBuffer());
    });
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

  @override
  void _startTournament() {
    _data.currentRound = 1;
    _shuffleDeckAndDeal();
  }

  void _shuffleDeckAndDeal() {
    //no  of  stacked cards =  53* noOfDeck
    var stack = List<int>.generate(
        _data.noOfDeck * NO_OF_CARDS, (int index) => index % NO_OF_CARDS);
    //shuffle
    stack.shuffle();

    //deal cards

    //var playerCards = Map<int, List<int>>();
    for (var i = 0; i < NO_OF_RUMMY_CARDS * _data.noOfPlayers; i++) {
      //if (!playerCards.containsKey(i % _data.noOfPlayers)) {
      if (!_data.playerCards.containsKey(i % _data.noOfPlayers)) {
        List<int> a = List.empty(growable: true);
        a.add(stack[i]);

        _data.playerCards[i % _data.noOfPlayers] = PlayerCard(cards: a);

        //playerCards[i % _data.noOfPlayers] = a;

      } else {
        _data.playerCards[i % _data.noOfPlayers]?.cards.add(stack[i]);

        //playerCards[i % _data.noOfPlayers]?.add(stack[i]);
      }
    }
    //remove the dealed cards from stack.

    stack.removeRange(0, NO_OF_RUMMY_CARDS * _data.noOfPlayers);

    _data.cardStack.addAll(stack);
  }

  @override
  void handleClientGameStat(
      ClientGameStat clientGameStat, WebSocketChannel wc) {
    switch (clientGameStat.whichStat()) {
      case ClientGameStat_Stat.discardCard:
        _handleDiscardCard(clientGameStat);
        break;
      case ClientGameStat_Stat.drawCard:
        _handleDrawCard(clientGameStat);
        break;
      default:
    }
  }

  void _handleDiscardCard(ClientGameStat clientGameStat) {
    int card = clientGameStat.discardCard.card;
    int playerId = clientGameStat.playerId;
    _data.currentPlayerId = (playerId + 1) % _data.noOfPlayers;
    if (card == _data.cardStack[0]) {
      //from deck
      _data.cardStack.removeAt(0);
      //_data.discardedCards.add(card);
    } else {
      //previous player discarded cards
      _data.discardedCards.add(card);
      _data.nextCard = _data.cardStack[0];
      _data.currentPlayerId = playerId;
    }
    _sendGameUpdate();
  }

  void _sendGameUpdate() {
    playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        gameServerUpdate: GameServerUpdate(
          rummyPlayerStat: RummyPlayerStat(
            inactiveRPS: playerId != _data.currentPlayerId
                ? InActiveRummyPlaterStat(
                    activePlayerId: _data.currentPlayerId,
                    status: "something",
                  )
                : null,
            activeRPS: playerId == _data.currentPlayerId
                ? ActiveRummyPlayerStat(
                    nextCard: _data.nextCard,
                    arpAction: _data.nextCard == _data.cardStack[0]
                        ? ARPAction.DRAW_CARD
                        : ARPAction.DROP_CARD,
                  )
                : null,
          ),
        ),
      );
      channel.sink.add(gms.writeToBuffer());
    });
  }

  void _handleDrawCard(ClientGameStat clientGameStat) {}
}
