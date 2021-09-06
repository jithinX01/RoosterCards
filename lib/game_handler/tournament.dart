import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/proto/game_msg.pb.dart';
import 'package:rooster_cards/proto/tournament_data.pbserver.dart';
//import 'package:rooster_cards/rummy/winning_hand.dart';
import 'package:rooster_cards/rummy/possible_winning_hand_lib.dart';
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
    //initialise
    for (var i = 0; i < _data.noOfPlayers; i++) {
      _data.winCount.add(0);
    }
    _data.maxWinCount = 0;
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
    //rprint("ServerSending Data");
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

  void _sendStartTournament() {}

  String _getPlayerName(int playerId, int previousPlayerId) {
    if (playerId == previousPlayerId) {
      return "You";
    } else {
      return _data.players[previousPlayerId];
    }
  }

  void _handleTournamentEnd() {
    var winList = [];
    for (var i = 0; i < _data.winCount.length; i++) {
      if (_data.winCount[i] == _data.maxWinCount) winList.add(i);
    }
    bool sharedTrophy = winList.length > 1;
    _sendTournamentOver(sharedTrophy, winList);
  }

  void _sendTournamentOver(bool sharedTrophy, var winList) {
    playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        tournamentOver: TournamentOver(
          sharedTrophy: sharedTrophy,
          trophyWinners: _getWinPlayerNames(playerId, winList),
          youWon: winList.contains(playerId),
        ),
      );

      channel.sink.add(gms.writeToBuffer());
    });
  }

  List<String> _getWinPlayerNames(int playerId, var winList) {
    List<String> winPlayers = [];
    for (var id in winList) {
      if (id == playerId)
        winPlayers.add("You");
      else
        winPlayers.add(_data.players[id]);
    }
    return winPlayers;
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

  @override
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
    //sort the player card list
    _data.playerCards.forEach((key, value) {
      value.cards.sort();
    });
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
    bool fromDeck = false;
    if (card == _data.cardStack[0]) {
      //from deck
      _data.cardStack.removeAt(0);
      //if card stack empty reshuffle
      if (_data.cardStack.isEmpty) {
        _data.discardedCards.shuffle();
        _data.cardStack.addAll(_data.discardedCards);
        _data.discardedCards.clear();
      }
      //_data.discardedCards.add(card);
    } else {
      //previous player discarded cards
      _data.discardedCards.add(card);
      _data.nextCard = _data.cardStack[0];
      _data.currentPlayerId = playerId;
      fromDeck = true;
    }
    String status =
        " Dropped " + PACK[card].infoUtf + (fromDeck ? " Took a card" : "");
    _sendGameUpdate(status: status, previousPlayerId: playerId);
  }

  void _handleDrawCard(ClientGameStat clientGameStat) {
    int playerId = clientGameStat.playerId;
    //next player
    _data.currentPlayerId = (playerId + 1) % _data.noOfPlayers;

    int oldCard = clientGameStat.drawCard.oldCard;
    int newCard = clientGameStat.drawCard.newCard;
    //next card
    _data.nextCard = oldCard;
    bool fromDeck = false;
    //remove new Card if it was from stack
    if (newCard == _data.cardStack[0]) {
      //from deck
      fromDeck = true;
      _data.cardStack.removeAt(0);
      //_data.discardedCards.add(card);
    }
    String status = "";
    if (fromDeck) {
      status = " Took a card, Dropped " + PACK[oldCard].infoUtf;
    } else {
      status = " Took " +
          PACK[newCard].infoUtf +
          " , Dropped " +
          PACK[oldCard].infoUtf;
    }

    _data.playerCards[playerId]?.cards.remove(oldCard);
    _data.playerCards[playerId]?.cards.add(newCard);
    if (isWinningHand(_data.playerCards[playerId]?.cards)) {
      //rprint("$playerId won");
      _handleGameWin(playerId);
    } else {
      _sendGameUpdate(status: status, previousPlayerId: playerId);
    }
  }

  void _sendGameUpdate({String status = ":)", required int previousPlayerId}) {
    playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        gameServerUpdate: GameServerUpdate(
          rummyPlayerStat: RummyPlayerStat(
            inactiveRPS: playerId != _data.currentPlayerId
                ? InActiveRummyPlaterStat(
                    activePlayerId: _data.currentPlayerId,
                    status: _getPlayerName(playerId, previousPlayerId) + status,
                  )
                : null,
            activeRPS: playerId == _data.currentPlayerId
                ? ActiveRummyPlayerStat(
                    nextCard: _data.nextCard,
                    arpAction: _data.nextCard == _data.cardStack[0]
                        ? ARPAction.DRAW_CARD
                        : ARPAction.DROP_CARD,
                    status: _getPlayerName(playerId, previousPlayerId) + status,
                  )
                : null,
          ),
        ),
      );
      channel.sink.add(gms.writeToBuffer());
    });
  }

  void _handleGameWin(int winnerId) {
    _data.roundWinner.add(winnerId);
    _data.winCount[winnerId] += 1;
    if (_data.winCount[winnerId] > _data.maxWinCount) {
      _data.maxWinCount = _data.winCount[winnerId];
    }
    calulatePoints(winnerId);
    _sendGameWonUpdate(winnerId);

    _data.currentRound += 1;
    if (_data.currentRound < _data.noOfRounds + 1) {
      _startNextGame();
      //winner starts next game.
      _data.currentPlayerId = winnerId;
      //after 5 seconds
      _sendNextGameUpdate();
      //Timer(Duration(seconds: 5), _sendNextGameUpdate);
    } else {
      //rprint("Tournament Over");
      _handleTournamentEnd();
    }
  }

  void calulatePoints(int winnerId) {
    AfterWinCards afterWinCards = AfterWinCards();
    _data.playerCards.forEach((key, value) {
      if (winnerId != key) {
        var point = findPoints(value.cards);
        _data.rummyData.crPoints[_data.players[key]] = point;

        if (_data.rummyData.points.containsKey(_data.players[key])) {
          _data.rummyData.points[_data.players[key]] =
              _data.rummyData.points[_data.players[key]] ?? 0 + point;
        } else {
          _data.rummyData.points[_data.players[key]] = point;
        }
      } else {
        if (!_data.rummyData.points.containsKey(_data.players[key]))
          _data.rummyData.points[_data.players[key]] = 0;
        _data.rummyData.crPoints[_data.players[key]] = 0;
      }
      afterWinCards.playerCards[_data.players[key]] = value;
    });

    _data.rummyData.winCards.add(afterWinCards);
  }

  void _sendGameWonUpdate(int winnerId) {
    playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        gameServerUpdate: GameServerUpdate(
          rummyPlayerStat: RummyPlayerStat(
            wonPlayerStat: winnerId == playerId
                ? WonPlayerStat(
                    round: _data.currentRound,
                    afterWinCards:
                        _data.rummyData.winCards[_data.currentRound - 1],
                    points: _data.rummyData.crPoints,
                  )
                : null,
            losePlayerStat: winnerId != playerId
                ? LosePlayerStat(
                    round: _data.currentRound,
                    wonPlayer: _data.players[winnerId],
                    winningCards: _data.playerCards[winnerId]?.cards,
                    afterWinCards:
                        _data.rummyData.winCards[_data.currentRound - 1],
                    points: _data.rummyData.crPoints,
                  )
                : null,
          ),
        ),
      );

      channel.sink.add(gms.writeToBuffer());
    });
  }

  void _startNextGame() {
    //reset.
    _data.cardStack.clear();
    _data.playerCards.forEach((key, value) {
      value.cards.clear();
    });
    _data.discardedCards.clear();
    _shuffleDeckAndDeal();
  }

  void _sendNextGameUpdate() {
    playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        gameServerUpdate: GameServerUpdate(
          rummyPlayerStat: RummyPlayerStat(
            nextGame: NextGame(
              cards: _data.playerCards[playerId]?.cards,
              youStart: _data.currentPlayerId == playerId,
              activePlayerId: _data.currentPlayerId,
              round: _data.currentRound,
              nextCard:
                  _data.currentPlayerId == playerId ? _data.cardStack[0] : -1,
            ),
          ),
        ),
      );
      channel.sink.add(gms.writeToBuffer());
    });
  }
}
