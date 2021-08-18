///
//  Generated code. Do not modify.
//  source: tournament_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'tournament_data.pbenum.dart';

export 'tournament_data.pbenum.dart';

enum TournamentData_Type {
  rummyData, 
  notSet
}

class TournamentData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TournamentData_Type> _TournamentData_TypeByTag = {
    10 : TournamentData_Type.rummyData,
    0 : TournamentData_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentData', createEmptyInstance: create)
    ..oo(0, [10])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfPlayers', $pb.PbFieldType.O3, protoName: 'noOfPlayers')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfRounds', $pb.PbFieldType.O3, protoName: 'noOfRounds')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfDeck', $pb.PbFieldType.O3, protoName: 'noOfDeck')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players')
    ..p<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cardStack', $pb.PbFieldType.P3, protoName: 'cardStack')
    ..m<$core.int, PlayerCard>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerCards', protoName: 'playerCards', entryClassName: 'TournamentData.PlayerCardsEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OM, valueCreator: PlayerCard.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPlayerId', $pb.PbFieldType.O3, protoName: 'currentPlayerId')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentName', protoName: 'tournamentName')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyId', $pb.PbFieldType.O3, protoName: 'trophyId')
    ..aOM<RummyTournamentData>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rummyData', subBuilder: RummyTournamentData.create)
    ..p<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discardedCards', $pb.PbFieldType.P3, protoName: 'discardedCards')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentRound', $pb.PbFieldType.O3, protoName: 'currentRound')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentId', $pb.PbFieldType.O3, protoName: 'tournamentId')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextCard', $pb.PbFieldType.O3, protoName: 'nextCard')
    ..p<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roundWinner', $pb.PbFieldType.P3, protoName: 'roundWinner')
    ..p<$core.int>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'winCount', $pb.PbFieldType.P3, protoName: 'winCount')
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxWinCount', $pb.PbFieldType.O3, protoName: 'maxWinCount')
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'done')
    ..hasRequiredFields = false
  ;

  TournamentData._() : super();
  factory TournamentData({
    $core.int? noOfPlayers,
    $core.int? noOfRounds,
    $core.int? noOfDeck,
    $core.Iterable<$core.String>? players,
    $core.Iterable<$core.int>? cardStack,
    $core.Map<$core.int, PlayerCard>? playerCards,
    $core.int? currentPlayerId,
    $core.String? tournamentName,
    $core.int? trophyId,
    RummyTournamentData? rummyData,
    $core.Iterable<$core.int>? discardedCards,
    $core.int? currentRound,
    $core.int? tournamentId,
    $core.int? nextCard,
    $core.Iterable<$core.int>? roundWinner,
    $core.Iterable<$core.int>? winCount,
    $core.int? maxWinCount,
    $core.bool? done,
  }) {
    final _result = create();
    if (noOfPlayers != null) {
      _result.noOfPlayers = noOfPlayers;
    }
    if (noOfRounds != null) {
      _result.noOfRounds = noOfRounds;
    }
    if (noOfDeck != null) {
      _result.noOfDeck = noOfDeck;
    }
    if (players != null) {
      _result.players.addAll(players);
    }
    if (cardStack != null) {
      _result.cardStack.addAll(cardStack);
    }
    if (playerCards != null) {
      _result.playerCards.addAll(playerCards);
    }
    if (currentPlayerId != null) {
      _result.currentPlayerId = currentPlayerId;
    }
    if (tournamentName != null) {
      _result.tournamentName = tournamentName;
    }
    if (trophyId != null) {
      _result.trophyId = trophyId;
    }
    if (rummyData != null) {
      _result.rummyData = rummyData;
    }
    if (discardedCards != null) {
      _result.discardedCards.addAll(discardedCards);
    }
    if (currentRound != null) {
      _result.currentRound = currentRound;
    }
    if (tournamentId != null) {
      _result.tournamentId = tournamentId;
    }
    if (nextCard != null) {
      _result.nextCard = nextCard;
    }
    if (roundWinner != null) {
      _result.roundWinner.addAll(roundWinner);
    }
    if (winCount != null) {
      _result.winCount.addAll(winCount);
    }
    if (maxWinCount != null) {
      _result.maxWinCount = maxWinCount;
    }
    if (done != null) {
      _result.done = done;
    }
    return _result;
  }
  factory TournamentData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentData clone() => TournamentData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentData copyWith(void Function(TournamentData) updates) => super.copyWith((message) => updates(message as TournamentData)) as TournamentData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentData create() => TournamentData._();
  TournamentData createEmptyInstance() => create();
  static $pb.PbList<TournamentData> createRepeated() => $pb.PbList<TournamentData>();
  @$core.pragma('dart2js:noInline')
  static TournamentData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentData>(create);
  static TournamentData? _defaultInstance;

  TournamentData_Type whichType() => _TournamentData_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get noOfPlayers => $_getIZ(0);
  @$pb.TagNumber(1)
  set noOfPlayers($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNoOfPlayers() => $_has(0);
  @$pb.TagNumber(1)
  void clearNoOfPlayers() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get noOfRounds => $_getIZ(1);
  @$pb.TagNumber(2)
  set noOfRounds($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoOfRounds() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoOfRounds() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get noOfDeck => $_getIZ(2);
  @$pb.TagNumber(3)
  set noOfDeck($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNoOfDeck() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoOfDeck() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get players => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get cardStack => $_getList(4);

  @$pb.TagNumber(6)
  $core.Map<$core.int, PlayerCard> get playerCards => $_getMap(5);

  @$pb.TagNumber(7)
  $core.int get currentPlayerId => $_getIZ(6);
  @$pb.TagNumber(7)
  set currentPlayerId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentPlayerId() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentPlayerId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tournamentName => $_getSZ(7);
  @$pb.TagNumber(8)
  set tournamentName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTournamentName() => $_has(7);
  @$pb.TagNumber(8)
  void clearTournamentName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get trophyId => $_getIZ(8);
  @$pb.TagNumber(9)
  set trophyId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTrophyId() => $_has(8);
  @$pb.TagNumber(9)
  void clearTrophyId() => clearField(9);

  @$pb.TagNumber(10)
  RummyTournamentData get rummyData => $_getN(9);
  @$pb.TagNumber(10)
  set rummyData(RummyTournamentData v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRummyData() => $_has(9);
  @$pb.TagNumber(10)
  void clearRummyData() => clearField(10);
  @$pb.TagNumber(10)
  RummyTournamentData ensureRummyData() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.List<$core.int> get discardedCards => $_getList(10);

  @$pb.TagNumber(12)
  $core.int get currentRound => $_getIZ(11);
  @$pb.TagNumber(12)
  set currentRound($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCurrentRound() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrentRound() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get tournamentId => $_getIZ(12);
  @$pb.TagNumber(13)
  set tournamentId($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTournamentId() => $_has(12);
  @$pb.TagNumber(13)
  void clearTournamentId() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get nextCard => $_getIZ(13);
  @$pb.TagNumber(14)
  set nextCard($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNextCard() => $_has(13);
  @$pb.TagNumber(14)
  void clearNextCard() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<$core.int> get roundWinner => $_getList(14);

  @$pb.TagNumber(16)
  $core.List<$core.int> get winCount => $_getList(15);

  @$pb.TagNumber(17)
  $core.int get maxWinCount => $_getIZ(16);
  @$pb.TagNumber(17)
  set maxWinCount($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasMaxWinCount() => $_has(16);
  @$pb.TagNumber(17)
  void clearMaxWinCount() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get done => $_getBF(17);
  @$pb.TagNumber(18)
  set done($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasDone() => $_has(17);
  @$pb.TagNumber(18)
  void clearDone() => clearField(18);
}

class RummyTournamentData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RummyTournamentData', createEmptyInstance: create)
    ..e<RummyState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: RummyState.INIT, valueOf: RummyState.valueOf, enumValues: RummyState.values)
    ..pc<AfterWinCards>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'winCards', $pb.PbFieldType.PM, protoName: 'winCards', subBuilder: AfterWinCards.create)
    ..m<$core.String, $core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'points', entryClassName: 'RummyTournamentData.PointsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3)
    ..m<$core.String, $core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'crPoints', protoName: 'crPoints', entryClassName: 'RummyTournamentData.CrPointsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RummyTournamentData._() : super();
  factory RummyTournamentData({
    RummyState? state,
    $core.Iterable<AfterWinCards>? winCards,
    $core.Map<$core.String, $core.int>? points,
    $core.Map<$core.String, $core.int>? crPoints,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (winCards != null) {
      _result.winCards.addAll(winCards);
    }
    if (points != null) {
      _result.points.addAll(points);
    }
    if (crPoints != null) {
      _result.crPoints.addAll(crPoints);
    }
    return _result;
  }
  factory RummyTournamentData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RummyTournamentData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RummyTournamentData clone() => RummyTournamentData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RummyTournamentData copyWith(void Function(RummyTournamentData) updates) => super.copyWith((message) => updates(message as RummyTournamentData)) as RummyTournamentData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RummyTournamentData create() => RummyTournamentData._();
  RummyTournamentData createEmptyInstance() => create();
  static $pb.PbList<RummyTournamentData> createRepeated() => $pb.PbList<RummyTournamentData>();
  @$core.pragma('dart2js:noInline')
  static RummyTournamentData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RummyTournamentData>(create);
  static RummyTournamentData? _defaultInstance;

  @$pb.TagNumber(1)
  RummyState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(RummyState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<AfterWinCards> get winCards => $_getList(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.int> get points => $_getMap(2);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.int> get crPoints => $_getMap(3);
}

class PlayerCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerCard', createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cards', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  PlayerCard._() : super();
  factory PlayerCard({
    $core.Iterable<$core.int>? cards,
  }) {
    final _result = create();
    if (cards != null) {
      _result.cards.addAll(cards);
    }
    return _result;
  }
  factory PlayerCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerCard clone() => PlayerCard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerCard copyWith(void Function(PlayerCard) updates) => super.copyWith((message) => updates(message as PlayerCard)) as PlayerCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerCard create() => PlayerCard._();
  PlayerCard createEmptyInstance() => create();
  static $pb.PbList<PlayerCard> createRepeated() => $pb.PbList<PlayerCard>();
  @$core.pragma('dart2js:noInline')
  static PlayerCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerCard>(create);
  static PlayerCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cards => $_getList(0);
}

class AfterWinCards extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AfterWinCards', createEmptyInstance: create)
    ..m<$core.String, PlayerCard>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerCards', protoName: 'playerCards', entryClassName: 'AfterWinCards.PlayerCardsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: PlayerCard.create)
    ..hasRequiredFields = false
  ;

  AfterWinCards._() : super();
  factory AfterWinCards({
    $core.Map<$core.String, PlayerCard>? playerCards,
  }) {
    final _result = create();
    if (playerCards != null) {
      _result.playerCards.addAll(playerCards);
    }
    return _result;
  }
  factory AfterWinCards.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AfterWinCards.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AfterWinCards clone() => AfterWinCards()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AfterWinCards copyWith(void Function(AfterWinCards) updates) => super.copyWith((message) => updates(message as AfterWinCards)) as AfterWinCards; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AfterWinCards create() => AfterWinCards._();
  AfterWinCards createEmptyInstance() => create();
  static $pb.PbList<AfterWinCards> createRepeated() => $pb.PbList<AfterWinCards>();
  @$core.pragma('dart2js:noInline')
  static AfterWinCards getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AfterWinCards>(create);
  static AfterWinCards? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, PlayerCard> get playerCards => $_getMap(0);
}

