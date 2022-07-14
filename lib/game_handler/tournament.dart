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
  var _playerConnections = Map<int, WebSocketChannel>();
  var _exPlayerConnections = Map<int, WebSocketChannel>();
  List<int> _roundEliminated = [];

  Tournament(InitStart initStart, WebSocketChannel wc, int tournamentId) {
    _data = TournamentData(
      noOfDeck: initStart.noOfDeck,
      noOfPlayers: initStart.noOfPlayers,
      noOfRounds: initStart.noOfRounds,
      trophyId: initStart.trophyId,
      tournamentName: initStart.tournamentName,
      coins: initStart.coins,
      rewardCoins: initStart.coins * initStart.noOfPlayers,
    );
    //initialise
    for (var i = 0; i < _data.noOfPlayers; i++) {
      _data.winCount.add(0);
    }
    _data.maxWinCount = 0;
    _data.players.add(initStart.playerName);
    _data.currentPlayerId = _joinedPlayers;
    _playerConnections[_joinedPlayers] = wc;
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
    _playerConnections[connectedPlayerId] = wc;
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
    _playerConnections.forEach((key, value) {
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

  //void _handleTournamentEnd() {}

  void _sendTournamentOver(var winList, {bool sharedTrophy = false}) {
    _playerConnections.forEach((playerId, channel) {
      GameMessageServer gms = GameMessageServer(
        tournamentOver: TournamentOver(
          sharedTrophy: sharedTrophy,
          trophyWinners: _getWinPlayerNames(playerId, winList),
          youWon: winList.contains(playerId),
          coinTransaction: winList.contains(playerId)
              ? (_data.rewardCoins - _data.coins)
              : -(_data.coins),
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

  void handleWSDisconnect(WebSocketChannel wc) {
    //rprint("handleWSDisconnect");
    for (var item in _playerConnections.entries) {
      if (item.value == wc) {
        var player = _data.players[item.key];
        //rprint("$player disconnected");
        //playerConnections.remove(item.key);
      }
    }
  }

  int _nextPlayerId(int playerId) {
    int nextPlayerId =
        (playerId + 1) % (_data.noOfPlayers + _data.playerIdOut.length);
    while (_data.playerIdOut.contains(nextPlayerId)) {
      playerId = nextPlayerId;
      nextPlayerId =
          (playerId + 1) % (_data.noOfPlayers + _data.playerIdOut.length);
    }
    return nextPlayerId;
  }
}

class RummyTournament extends Tournament {
  //late RummyTournamentData _data;
  RummyTournament(InitStart initStart, WebSocketChannel wc, int tournamentId)
      : super(initStart, wc, tournamentId);
  @override
  void _gameTypeInit(InitStart initStart) {
    _data.rummyData = RummyTournamentData(state: RummyState.INIT);
    _data.rummyData.maxPointGame = initStart.rummyInitData.maxPointGame;
    _data.rummyData.maxPoint = initStart.rummyInitData.maxPoint;
  }

  @override
  void _startTournament() {
    _data.currentRound = 1;

    _data.players.forEach((player) {
      List<int> a = List.empty(growable: true);
      _data.playerCards[_data.players.indexOf(player)] = PlayerCard(cards: a);
    });

    _shuffleDeckAndDeal();
  }

  @override
  void _sendStartTournament() {
    _data.nextCard = _data.cardStack[0];
    _playerConnections.forEach((key, channel) {
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

  //@override
  void _handleTournamentEnd() {
    var winList = [];
    /*
    for (var i = 0; i < _data.winCount.length; i++) {
      if (_data.winCount[i] == _data.maxWinCount) winList.add(i);
    }
    */

    var min = 100000000;
    _data.rummyData.points.forEach((player, pts) {
      if (pts <= min) {
        winList.add(_data.players.indexOf(player));
        min = pts;
      }
    });
    bool sharedTrophy = winList.length > 1;
    _sendTournamentOver(winList, sharedTrophy: sharedTrophy);
  }

  void _shuffleDeckAndDeal() {
    //no  of  stacked cards =  53* noOfDeck
    var stack = List<int>.generate(
        _data.noOfDeck * NO_OF_CARDS, (int index) => index % NO_OF_CARDS);
    //shuffle
    stack.shuffle();

    //deal cards
    /*
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
    */
    var playerids = _data.playerCards.keys.toList();
    for (var i = 0;
        i < NO_OF_RUMMY_CARDS * _data.noOfPlayers;
        i = i + _data.noOfPlayers) {
      for (var j = 0; j < _data.noOfPlayers; j++) {
        _data.playerCards[playerids[j]]!.cards.add(stack[i + j]);
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
    //_data.currentPlayerId = (playerId + 1) % _data.noOfPlayers;
    _data.currentPlayerId = _nextPlayerId(playerId);
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
    //_data.currentPlayerId = (playerId + 1) % _data.noOfPlayers;
    _data.currentPlayerId = _nextPlayerId(playerId);
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
    _playerConnections.forEach((playerId, channel) {
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
    /*
    if (_data.currentRound + 1 < _data.noOfRounds) {
      _data.currentRound += 1;
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
    */

    if (_data.rummyData.maxPointGame) {
      _handleNextRoundMPGame(winnerId);
    } else {
      _handleNextRoundNormal(winnerId);
    }
  }

  void _handleNextRoundMPGame(var winnerId) {
    if (_data.noOfPlayers - _roundEliminated.length == 1) {
      _sendTournamentOver([winnerId]);
    } else {
      if (_roundEliminated.isNotEmpty) {
        GameMessageServer gms = GameMessageServer(
            gameServerUpdate: GameServerUpdate(
                rummyPlayerStat: RummyPlayerStat(
                    eliminated: Eliminated(
          round: _data.currentRound,
          totalPoints: _data.rummyData.points,
          coinTransaction: -(_data.coins),
        ))));

        _roundEliminated.forEach((playerId) {
          //add to removed list
          _data.playerIdOut.add(playerId);
          _data.noOfPlayers--;
          _playerConnections[playerId]!.sink.add(gms.writeToBuffer());
          _exPlayerConnections[playerId] = _playerConnections[playerId]!;
          _playerConnections.remove(playerId);
          _data.playerCards.remove(playerId);
          _data.rummyData.crPoints.remove(_data.players.elementAt(playerId));
          _data.rummyData.points.remove(_data.players.elementAt(playerId));
        });
        _roundEliminated.clear();
      }
      _data.currentRound += 1;
      _startNextGame();
      //winner starts next game.
      _data.currentPlayerId = winnerId;
      //after 5 seconds
      _sendNextGameUpdate();
    }
  }

  void _handleNextRoundNormal(var winnerId) {
    if (_data.currentRound < _data.noOfRounds) {
      _data.currentRound += 1;
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
    _data.playerCards.forEach((playerId, playercards) {
      if (winnerId != playerId) {
        var point = findPoints(playercards.cards);
        //print("$playerId -- $point -- ${playercards.cards}");
        _data.rummyData.crPoints[_data.players[playerId]] = point;

        if (_data.rummyData.points.containsKey(_data.players[playerId])) {
          _data.rummyData.points[_data.players[playerId]] =
              _data.rummyData.points[_data.players[playerId]]! + point;
        } else {
          _data.rummyData.points[_data.players[playerId]] = point;
        }
      } else {
        if (!_data.rummyData.points.containsKey(_data.players[playerId]))
          _data.rummyData.points[_data.players[playerId]] = 0;
        _data.rummyData.crPoints[_data.players[playerId]] = 0;
      }
      afterWinCards.playerCards[_data.players[playerId]] = playercards;

      //for max points elimination.
      if (_data.rummyData.maxPointGame &&
          _data.rummyData.points[_data.players[playerId]]! >
              _data.rummyData.maxPoint) {
        _roundEliminated.add(playerId);
      }
    });
    _data.rummyData.winCards.add(afterWinCards);
    _sortByPoints();
  }

  void _sortByPoints() {
    //current points
    var crMapEntries = _data.rummyData.crPoints.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    _data.rummyData.crPoints
      ..clear()
      ..addEntries(crMapEntries);
    //total points
    var mapEntries = _data.rummyData.points.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    _data.rummyData.points
      ..clear()
      ..addEntries(mapEntries);
  }

  void _sendGameWonUpdate(int winnerId) {
    _playerConnections.forEach((playerId, channel) {
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
    _playerConnections.forEach((playerId, channel) {
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
