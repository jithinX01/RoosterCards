///
//  Generated code. Do not modify.
//  source: game_msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'game_msg.pbenum.dart';

export 'game_msg.pbenum.dart';

enum GameMessageClient_PayLoad {
  initStart, 
  join, 
  clientGameStat, 
  tournamentProgress, 
  notSet
}

class GameMessageClient extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameMessageClient_PayLoad> _GameMessageClient_PayLoadByTag = {
    2 : GameMessageClient_PayLoad.initStart,
    3 : GameMessageClient_PayLoad.join,
    4 : GameMessageClient_PayLoad.clientGameStat,
    5 : GameMessageClient_PayLoad.tournamentProgress,
    0 : GameMessageClient_PayLoad.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessageClient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..aOM<InitStart>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initStart', protoName: 'initStart', subBuilder: InitStart.create)
    ..aOM<Join>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join', subBuilder: Join.create)
    ..aOM<ClientGameStat>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientGameStat', protoName: 'clientGameStat', subBuilder: ClientGameStat.create)
    ..aOM<TournamentProgress>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentProgress', protoName: 'tournamentProgress', subBuilder: TournamentProgress.create)
    ..hasRequiredFields = false
  ;

  GameMessageClient._() : super();
  factory GameMessageClient({
    InitStart? initStart,
    Join? join,
    ClientGameStat? clientGameStat,
    TournamentProgress? tournamentProgress,
  }) {
    final _result = create();
    if (initStart != null) {
      _result.initStart = initStart;
    }
    if (join != null) {
      _result.join = join;
    }
    if (clientGameStat != null) {
      _result.clientGameStat = clientGameStat;
    }
    if (tournamentProgress != null) {
      _result.tournamentProgress = tournamentProgress;
    }
    return _result;
  }
  factory GameMessageClient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessageClient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessageClient clone() => GameMessageClient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessageClient copyWith(void Function(GameMessageClient) updates) => super.copyWith((message) => updates(message as GameMessageClient)) as GameMessageClient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessageClient create() => GameMessageClient._();
  GameMessageClient createEmptyInstance() => create();
  static $pb.PbList<GameMessageClient> createRepeated() => $pb.PbList<GameMessageClient>();
  @$core.pragma('dart2js:noInline')
  static GameMessageClient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessageClient>(create);
  static GameMessageClient? _defaultInstance;

  GameMessageClient_PayLoad whichPayLoad() => _GameMessageClient_PayLoadByTag[$_whichOneof(0)]!;
  void clearPayLoad() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  InitStart get initStart => $_getN(0);
  @$pb.TagNumber(2)
  set initStart(InitStart v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitStart() => $_has(0);
  @$pb.TagNumber(2)
  void clearInitStart() => clearField(2);
  @$pb.TagNumber(2)
  InitStart ensureInitStart() => $_ensure(0);

  @$pb.TagNumber(3)
  Join get join => $_getN(1);
  @$pb.TagNumber(3)
  set join(Join v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasJoin() => $_has(1);
  @$pb.TagNumber(3)
  void clearJoin() => clearField(3);
  @$pb.TagNumber(3)
  Join ensureJoin() => $_ensure(1);

  @$pb.TagNumber(4)
  ClientGameStat get clientGameStat => $_getN(2);
  @$pb.TagNumber(4)
  set clientGameStat(ClientGameStat v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasClientGameStat() => $_has(2);
  @$pb.TagNumber(4)
  void clearClientGameStat() => clearField(4);
  @$pb.TagNumber(4)
  ClientGameStat ensureClientGameStat() => $_ensure(2);

  @$pb.TagNumber(5)
  TournamentProgress get tournamentProgress => $_getN(3);
  @$pb.TagNumber(5)
  set tournamentProgress(TournamentProgress v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTournamentProgress() => $_has(3);
  @$pb.TagNumber(5)
  void clearTournamentProgress() => clearField(5);
  @$pb.TagNumber(5)
  TournamentProgress ensureTournamentProgress() => $_ensure(3);
}

class InitStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitStart', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..e<GameType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameType', $pb.PbFieldType.OE, protoName: 'gameType', defaultOrMaker: GameType.RUMMY, valueOf: GameType.valueOf, enumValues: GameType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerName', protoName: 'playerName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentName', protoName: 'tournamentName')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfDeck', $pb.PbFieldType.O3, protoName: 'noOfDeck')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfPlayers', $pb.PbFieldType.O3, protoName: 'noOfPlayers')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noOfRounds', $pb.PbFieldType.O3, protoName: 'noOfRounds')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyId', $pb.PbFieldType.O3, protoName: 'trophyId')
    ..hasRequiredFields = false
  ;

  InitStart._() : super();
  factory InitStart({
    GameType? gameType,
    $core.String? playerName,
    $core.String? tournamentName,
    $core.int? noOfDeck,
    $core.int? noOfPlayers,
    $core.int? noOfRounds,
    $core.int? trophyId,
  }) {
    final _result = create();
    if (gameType != null) {
      _result.gameType = gameType;
    }
    if (playerName != null) {
      _result.playerName = playerName;
    }
    if (tournamentName != null) {
      _result.tournamentName = tournamentName;
    }
    if (noOfDeck != null) {
      _result.noOfDeck = noOfDeck;
    }
    if (noOfPlayers != null) {
      _result.noOfPlayers = noOfPlayers;
    }
    if (noOfRounds != null) {
      _result.noOfRounds = noOfRounds;
    }
    if (trophyId != null) {
      _result.trophyId = trophyId;
    }
    return _result;
  }
  factory InitStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitStart clone() => InitStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitStart copyWith(void Function(InitStart) updates) => super.copyWith((message) => updates(message as InitStart)) as InitStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitStart create() => InitStart._();
  InitStart createEmptyInstance() => create();
  static $pb.PbList<InitStart> createRepeated() => $pb.PbList<InitStart>();
  @$core.pragma('dart2js:noInline')
  static InitStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitStart>(create);
  static InitStart? _defaultInstance;

  @$pb.TagNumber(1)
  GameType get gameType => $_getN(0);
  @$pb.TagNumber(1)
  set gameType(GameType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameType() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playerName => $_getSZ(1);
  @$pb.TagNumber(2)
  set playerName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tournamentName => $_getSZ(2);
  @$pb.TagNumber(3)
  set tournamentName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTournamentName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTournamentName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get noOfDeck => $_getIZ(3);
  @$pb.TagNumber(4)
  set noOfDeck($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNoOfDeck() => $_has(3);
  @$pb.TagNumber(4)
  void clearNoOfDeck() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get noOfPlayers => $_getIZ(4);
  @$pb.TagNumber(5)
  set noOfPlayers($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNoOfPlayers() => $_has(4);
  @$pb.TagNumber(5)
  void clearNoOfPlayers() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get noOfRounds => $_getIZ(5);
  @$pb.TagNumber(6)
  set noOfRounds($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNoOfRounds() => $_has(5);
  @$pb.TagNumber(6)
  void clearNoOfRounds() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get trophyId => $_getIZ(6);
  @$pb.TagNumber(7)
  set trophyId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrophyId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrophyId() => clearField(7);
}

class Join extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Join', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerName', protoName: 'playerName')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentId', $pb.PbFieldType.O3, protoName: 'tournamentId')
    ..hasRequiredFields = false
  ;

  Join._() : super();
  factory Join({
    $core.String? playerName,
    $core.int? tournamentId,
  }) {
    final _result = create();
    if (playerName != null) {
      _result.playerName = playerName;
    }
    if (tournamentId != null) {
      _result.tournamentId = tournamentId;
    }
    return _result;
  }
  factory Join.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Join.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Join clone() => Join()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Join copyWith(void Function(Join) updates) => super.copyWith((message) => updates(message as Join)) as Join; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Join create() => Join._();
  Join createEmptyInstance() => create();
  static $pb.PbList<Join> createRepeated() => $pb.PbList<Join>();
  @$core.pragma('dart2js:noInline')
  static Join getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Join>(create);
  static Join? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tournamentId => $_getIZ(1);
  @$pb.TagNumber(2)
  set tournamentId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTournamentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTournamentId() => clearField(2);
}

class ClientRummyAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientRummyAction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..e<CRAction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: CRAction.DRAW, valueOf: CRAction.valueOf, enumValues: CRAction.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newCard', $pb.PbFieldType.O3, protoName: 'newCard')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldCard', $pb.PbFieldType.O3, protoName: 'oldCard')
    ..hasRequiredFields = false
  ;

  ClientRummyAction._() : super();
  factory ClientRummyAction({
    CRAction? action,
    $core.int? newCard,
    $core.int? oldCard,
  }) {
    final _result = create();
    if (action != null) {
      _result.action = action;
    }
    if (newCard != null) {
      _result.newCard = newCard;
    }
    if (oldCard != null) {
      _result.oldCard = oldCard;
    }
    return _result;
  }
  factory ClientRummyAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientRummyAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientRummyAction clone() => ClientRummyAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientRummyAction copyWith(void Function(ClientRummyAction) updates) => super.copyWith((message) => updates(message as ClientRummyAction)) as ClientRummyAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientRummyAction create() => ClientRummyAction._();
  ClientRummyAction createEmptyInstance() => create();
  static $pb.PbList<ClientRummyAction> createRepeated() => $pb.PbList<ClientRummyAction>();
  @$core.pragma('dart2js:noInline')
  static ClientRummyAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientRummyAction>(create);
  static ClientRummyAction? _defaultInstance;

  @$pb.TagNumber(1)
  CRAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(CRAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get newCard => $_getIZ(1);
  @$pb.TagNumber(2)
  set newCard($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewCard() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get oldCard => $_getIZ(2);
  @$pb.TagNumber(3)
  set oldCard($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOldCard() => $_has(2);
  @$pb.TagNumber(3)
  void clearOldCard() => clearField(3);
}

enum ClientGameStat_Stat {
  clientRummyAction, 
  notSet
}

class ClientGameStat extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ClientGameStat_Stat> _ClientGameStat_StatByTag = {
    1 : ClientGameStat_Stat.clientRummyAction,
    0 : ClientGameStat_Stat.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientGameStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<ClientRummyAction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientRummyAction', protoName: 'clientRummyAction', subBuilder: ClientRummyAction.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', $pb.PbFieldType.O3, protoName: 'playerId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentId', $pb.PbFieldType.O3, protoName: 'tournamentId')
    ..hasRequiredFields = false
  ;

  ClientGameStat._() : super();
  factory ClientGameStat({
    ClientRummyAction? clientRummyAction,
    $core.int? playerId,
    $core.int? tournamentId,
  }) {
    final _result = create();
    if (clientRummyAction != null) {
      _result.clientRummyAction = clientRummyAction;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (tournamentId != null) {
      _result.tournamentId = tournamentId;
    }
    return _result;
  }
  factory ClientGameStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientGameStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientGameStat clone() => ClientGameStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientGameStat copyWith(void Function(ClientGameStat) updates) => super.copyWith((message) => updates(message as ClientGameStat)) as ClientGameStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientGameStat create() => ClientGameStat._();
  ClientGameStat createEmptyInstance() => create();
  static $pb.PbList<ClientGameStat> createRepeated() => $pb.PbList<ClientGameStat>();
  @$core.pragma('dart2js:noInline')
  static ClientGameStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientGameStat>(create);
  static ClientGameStat? _defaultInstance;

  ClientGameStat_Stat whichStat() => _ClientGameStat_StatByTag[$_whichOneof(0)]!;
  void clearStat() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ClientRummyAction get clientRummyAction => $_getN(0);
  @$pb.TagNumber(1)
  set clientRummyAction(ClientRummyAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientRummyAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientRummyAction() => clearField(1);
  @$pb.TagNumber(1)
  ClientRummyAction ensureClientRummyAction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get playerId => $_getIZ(1);
  @$pb.TagNumber(2)
  set playerId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tournamentId => $_getIZ(2);
  @$pb.TagNumber(3)
  set tournamentId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTournamentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTournamentId() => clearField(3);
}

class TournamentProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentProgress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..e<TPAction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: TPAction.TAKE_BREAK, valueOf: TPAction.valueOf, enumValues: TPAction.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'breakTime', $pb.PbFieldType.O3, protoName: 'breakTime')
    ..hasRequiredFields = false
  ;

  TournamentProgress._() : super();
  factory TournamentProgress({
    TPAction? action,
    $core.int? breakTime,
  }) {
    final _result = create();
    if (action != null) {
      _result.action = action;
    }
    if (breakTime != null) {
      _result.breakTime = breakTime;
    }
    return _result;
  }
  factory TournamentProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentProgress clone() => TournamentProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentProgress copyWith(void Function(TournamentProgress) updates) => super.copyWith((message) => updates(message as TournamentProgress)) as TournamentProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentProgress create() => TournamentProgress._();
  TournamentProgress createEmptyInstance() => create();
  static $pb.PbList<TournamentProgress> createRepeated() => $pb.PbList<TournamentProgress>();
  @$core.pragma('dart2js:noInline')
  static TournamentProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentProgress>(create);
  static TournamentProgress? _defaultInstance;

  @$pb.TagNumber(1)
  TPAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(TPAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get breakTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set breakTime($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBreakTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearBreakTime() => clearField(2);
}

enum GameMessageServer_PayLoad {
  initStartStat, 
  joinStat, 
  joinProgress, 
  startTournament, 
  gameServerUpdate, 
  errorStat, 
  notSet
}

class GameMessageServer extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameMessageServer_PayLoad> _GameMessageServer_PayLoadByTag = {
    2 : GameMessageServer_PayLoad.initStartStat,
    3 : GameMessageServer_PayLoad.joinStat,
    4 : GameMessageServer_PayLoad.joinProgress,
    5 : GameMessageServer_PayLoad.startTournament,
    6 : GameMessageServer_PayLoad.gameServerUpdate,
    7 : GameMessageServer_PayLoad.errorStat,
    0 : GameMessageServer_PayLoad.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessageServer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7])
    ..aOM<InitStartStat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initStartStat', protoName: 'initStartStat', subBuilder: InitStartStat.create)
    ..aOM<JoinStat>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joinStat', protoName: 'joinStat', subBuilder: JoinStat.create)
    ..aOM<JoinProgress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joinProgress', protoName: 'joinProgress', subBuilder: JoinProgress.create)
    ..aOM<StartTournament>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTournament', protoName: 'startTournament', subBuilder: StartTournament.create)
    ..aOM<GameServerUpdate>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameServerUpdate', protoName: 'gameServerUpdate', subBuilder: GameServerUpdate.create)
    ..aOM<ErrorStat>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorStat', protoName: 'errorStat', subBuilder: ErrorStat.create)
    ..hasRequiredFields = false
  ;

  GameMessageServer._() : super();
  factory GameMessageServer({
    InitStartStat? initStartStat,
    JoinStat? joinStat,
    JoinProgress? joinProgress,
    StartTournament? startTournament,
    GameServerUpdate? gameServerUpdate,
    ErrorStat? errorStat,
  }) {
    final _result = create();
    if (initStartStat != null) {
      _result.initStartStat = initStartStat;
    }
    if (joinStat != null) {
      _result.joinStat = joinStat;
    }
    if (joinProgress != null) {
      _result.joinProgress = joinProgress;
    }
    if (startTournament != null) {
      _result.startTournament = startTournament;
    }
    if (gameServerUpdate != null) {
      _result.gameServerUpdate = gameServerUpdate;
    }
    if (errorStat != null) {
      _result.errorStat = errorStat;
    }
    return _result;
  }
  factory GameMessageServer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessageServer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessageServer clone() => GameMessageServer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessageServer copyWith(void Function(GameMessageServer) updates) => super.copyWith((message) => updates(message as GameMessageServer)) as GameMessageServer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessageServer create() => GameMessageServer._();
  GameMessageServer createEmptyInstance() => create();
  static $pb.PbList<GameMessageServer> createRepeated() => $pb.PbList<GameMessageServer>();
  @$core.pragma('dart2js:noInline')
  static GameMessageServer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessageServer>(create);
  static GameMessageServer? _defaultInstance;

  GameMessageServer_PayLoad whichPayLoad() => _GameMessageServer_PayLoadByTag[$_whichOneof(0)]!;
  void clearPayLoad() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  InitStartStat get initStartStat => $_getN(0);
  @$pb.TagNumber(2)
  set initStartStat(InitStartStat v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitStartStat() => $_has(0);
  @$pb.TagNumber(2)
  void clearInitStartStat() => clearField(2);
  @$pb.TagNumber(2)
  InitStartStat ensureInitStartStat() => $_ensure(0);

  @$pb.TagNumber(3)
  JoinStat get joinStat => $_getN(1);
  @$pb.TagNumber(3)
  set joinStat(JoinStat v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasJoinStat() => $_has(1);
  @$pb.TagNumber(3)
  void clearJoinStat() => clearField(3);
  @$pb.TagNumber(3)
  JoinStat ensureJoinStat() => $_ensure(1);

  @$pb.TagNumber(4)
  JoinProgress get joinProgress => $_getN(2);
  @$pb.TagNumber(4)
  set joinProgress(JoinProgress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasJoinProgress() => $_has(2);
  @$pb.TagNumber(4)
  void clearJoinProgress() => clearField(4);
  @$pb.TagNumber(4)
  JoinProgress ensureJoinProgress() => $_ensure(2);

  @$pb.TagNumber(5)
  StartTournament get startTournament => $_getN(3);
  @$pb.TagNumber(5)
  set startTournament(StartTournament v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartTournament() => $_has(3);
  @$pb.TagNumber(5)
  void clearStartTournament() => clearField(5);
  @$pb.TagNumber(5)
  StartTournament ensureStartTournament() => $_ensure(3);

  @$pb.TagNumber(6)
  GameServerUpdate get gameServerUpdate => $_getN(4);
  @$pb.TagNumber(6)
  set gameServerUpdate(GameServerUpdate v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGameServerUpdate() => $_has(4);
  @$pb.TagNumber(6)
  void clearGameServerUpdate() => clearField(6);
  @$pb.TagNumber(6)
  GameServerUpdate ensureGameServerUpdate() => $_ensure(4);

  @$pb.TagNumber(7)
  ErrorStat get errorStat => $_getN(5);
  @$pb.TagNumber(7)
  set errorStat(ErrorStat v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasErrorStat() => $_has(5);
  @$pb.TagNumber(7)
  void clearErrorStat() => clearField(7);
  @$pb.TagNumber(7)
  ErrorStat ensureErrorStat() => $_ensure(5);
}

class ErrorStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ErrorStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorCode', $pb.PbFieldType.O3, protoName: 'errorCode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false
  ;

  ErrorStat._() : super();
  factory ErrorStat({
    $core.int? errorCode,
    $core.String? errorMessage,
  }) {
    final _result = create();
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (errorMessage != null) {
      _result.errorMessage = errorMessage;
    }
    return _result;
  }
  factory ErrorStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorStat clone() => ErrorStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorStat copyWith(void Function(ErrorStat) updates) => super.copyWith((message) => updates(message as ErrorStat)) as ErrorStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorStat create() => ErrorStat._();
  ErrorStat createEmptyInstance() => create();
  static $pb.PbList<ErrorStat> createRepeated() => $pb.PbList<ErrorStat>();
  @$core.pragma('dart2js:noInline')
  static ErrorStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorStat>(create);
  static ErrorStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);
}

class InitStartStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitStartStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', $pb.PbFieldType.O3, protoName: 'playerId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentId', $pb.PbFieldType.O3, protoName: 'tournamentId')
    ..hasRequiredFields = false
  ;

  InitStartStat._() : super();
  factory InitStartStat({
    $core.int? playerId,
    $core.int? tournamentId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (tournamentId != null) {
      _result.tournamentId = tournamentId;
    }
    return _result;
  }
  factory InitStartStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitStartStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitStartStat clone() => InitStartStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitStartStat copyWith(void Function(InitStartStat) updates) => super.copyWith((message) => updates(message as InitStartStat)) as InitStartStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitStartStat create() => InitStartStat._();
  InitStartStat createEmptyInstance() => create();
  static $pb.PbList<InitStartStat> createRepeated() => $pb.PbList<InitStartStat>();
  @$core.pragma('dart2js:noInline')
  static InitStartStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitStartStat>(create);
  static InitStartStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tournamentId => $_getIZ(1);
  @$pb.TagNumber(2)
  set tournamentId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTournamentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTournamentId() => clearField(2);
}

class JoinStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JoinStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', $pb.PbFieldType.O3, protoName: 'playerId')
    ..hasRequiredFields = false
  ;

  JoinStat._() : super();
  factory JoinStat({
    $core.int? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory JoinStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinStat clone() => JoinStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinStat copyWith(void Function(JoinStat) updates) => super.copyWith((message) => updates(message as JoinStat)) as JoinStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinStat create() => JoinStat._();
  JoinStat createEmptyInstance() => create();
  static $pb.PbList<JoinStat> createRepeated() => $pb.PbList<JoinStat>();
  @$core.pragma('dart2js:noInline')
  static JoinStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinStat>(create);
  static JoinStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class JoinProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JoinProgress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players')
    ..hasRequiredFields = false
  ;

  JoinProgress._() : super();
  factory JoinProgress({
    $core.Iterable<$core.String>? players,
  }) {
    final _result = create();
    if (players != null) {
      _result.players.addAll(players);
    }
    return _result;
  }
  factory JoinProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinProgress clone() => JoinProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinProgress copyWith(void Function(JoinProgress) updates) => super.copyWith((message) => updates(message as JoinProgress)) as JoinProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinProgress create() => JoinProgress._();
  JoinProgress createEmptyInstance() => create();
  static $pb.PbList<JoinProgress> createRepeated() => $pb.PbList<JoinProgress>();
  @$core.pragma('dart2js:noInline')
  static JoinProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinProgress>(create);
  static JoinProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get players => $_getList(0);
}

class StartTournament extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StartTournament', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..m<$core.int, $core.String>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerMap', protoName: 'playerMap', entryClassName: 'StartTournament.PlayerMapEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('game_message'))
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cards', $pb.PbFieldType.P3)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'youStart', protoName: 'youStart')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activePlayerId', $pb.PbFieldType.O3, protoName: 'activePlayerId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'round', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentName', protoName: 'tournamentName')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyId', $pb.PbFieldType.O3, protoName: 'trophyId')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourId', $pb.PbFieldType.O3, protoName: 'yourId')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextCard', $pb.PbFieldType.O3, protoName: 'nextCard')
    ..hasRequiredFields = false
  ;

  StartTournament._() : super();
  factory StartTournament({
    $core.Map<$core.int, $core.String>? playerMap,
    $core.Iterable<$core.int>? cards,
    $core.bool? youStart,
    $core.int? activePlayerId,
    $core.int? round,
    $core.String? tournamentName,
    $core.int? trophyId,
    $core.int? yourId,
    $core.int? nextCard,
  }) {
    final _result = create();
    if (playerMap != null) {
      _result.playerMap.addAll(playerMap);
    }
    if (cards != null) {
      _result.cards.addAll(cards);
    }
    if (youStart != null) {
      _result.youStart = youStart;
    }
    if (activePlayerId != null) {
      _result.activePlayerId = activePlayerId;
    }
    if (round != null) {
      _result.round = round;
    }
    if (tournamentName != null) {
      _result.tournamentName = tournamentName;
    }
    if (trophyId != null) {
      _result.trophyId = trophyId;
    }
    if (yourId != null) {
      _result.yourId = yourId;
    }
    if (nextCard != null) {
      _result.nextCard = nextCard;
    }
    return _result;
  }
  factory StartTournament.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartTournament.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartTournament clone() => StartTournament()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartTournament copyWith(void Function(StartTournament) updates) => super.copyWith((message) => updates(message as StartTournament)) as StartTournament; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartTournament create() => StartTournament._();
  StartTournament createEmptyInstance() => create();
  static $pb.PbList<StartTournament> createRepeated() => $pb.PbList<StartTournament>();
  @$core.pragma('dart2js:noInline')
  static StartTournament getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartTournament>(create);
  static StartTournament? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $core.String> get playerMap => $_getMap(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cards => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get youStart => $_getBF(2);
  @$pb.TagNumber(3)
  set youStart($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYouStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearYouStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get activePlayerId => $_getIZ(3);
  @$pb.TagNumber(4)
  set activePlayerId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasActivePlayerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearActivePlayerId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get round => $_getIZ(4);
  @$pb.TagNumber(5)
  set round($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRound() => $_has(4);
  @$pb.TagNumber(5)
  void clearRound() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tournamentName => $_getSZ(5);
  @$pb.TagNumber(6)
  set tournamentName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTournamentName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTournamentName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get trophyId => $_getIZ(6);
  @$pb.TagNumber(7)
  set trophyId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrophyId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrophyId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get yourId => $_getIZ(7);
  @$pb.TagNumber(8)
  set yourId($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasYourId() => $_has(7);
  @$pb.TagNumber(8)
  void clearYourId() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get nextCard => $_getIZ(8);
  @$pb.TagNumber(9)
  set nextCard($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNextCard() => $_has(8);
  @$pb.TagNumber(9)
  void clearNextCard() => clearField(9);
}

enum GameServerUpdate_Update {
  rummyPlayerStat, 
  notSet
}

class GameServerUpdate extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameServerUpdate_Update> _GameServerUpdate_UpdateByTag = {
    1 : GameServerUpdate_Update.rummyPlayerStat,
    0 : GameServerUpdate_Update.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameServerUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<RummyPlayerStat>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rummyPlayerStat', protoName: 'rummyPlayerStat', subBuilder: RummyPlayerStat.create)
    ..hasRequiredFields = false
  ;

  GameServerUpdate._() : super();
  factory GameServerUpdate({
    RummyPlayerStat? rummyPlayerStat,
  }) {
    final _result = create();
    if (rummyPlayerStat != null) {
      _result.rummyPlayerStat = rummyPlayerStat;
    }
    return _result;
  }
  factory GameServerUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameServerUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameServerUpdate clone() => GameServerUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameServerUpdate copyWith(void Function(GameServerUpdate) updates) => super.copyWith((message) => updates(message as GameServerUpdate)) as GameServerUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameServerUpdate create() => GameServerUpdate._();
  GameServerUpdate createEmptyInstance() => create();
  static $pb.PbList<GameServerUpdate> createRepeated() => $pb.PbList<GameServerUpdate>();
  @$core.pragma('dart2js:noInline')
  static GameServerUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameServerUpdate>(create);
  static GameServerUpdate? _defaultInstance;

  GameServerUpdate_Update whichUpdate() => _GameServerUpdate_UpdateByTag[$_whichOneof(0)]!;
  void clearUpdate() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RummyPlayerStat get rummyPlayerStat => $_getN(0);
  @$pb.TagNumber(1)
  set rummyPlayerStat(RummyPlayerStat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRummyPlayerStat() => $_has(0);
  @$pb.TagNumber(1)
  void clearRummyPlayerStat() => clearField(1);
  @$pb.TagNumber(1)
  RummyPlayerStat ensureRummyPlayerStat() => $_ensure(0);
}

enum RummyPlayerStat_Stat {
  activeRPS, 
  inactiveRPS, 
  notSet
}

class RummyPlayerStat extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, RummyPlayerStat_Stat> _RummyPlayerStat_StatByTag = {
    1 : RummyPlayerStat_Stat.activeRPS,
    2 : RummyPlayerStat_Stat.inactiveRPS,
    0 : RummyPlayerStat_Stat.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RummyPlayerStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ActiveRummyPlayerStat>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeRPS', protoName: 'activeRPS', subBuilder: ActiveRummyPlayerStat.create)
    ..aOM<InActiveRummyPlaterStat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inactiveRPS', protoName: 'inactiveRPS', subBuilder: InActiveRummyPlaterStat.create)
    ..hasRequiredFields = false
  ;

  RummyPlayerStat._() : super();
  factory RummyPlayerStat({
    ActiveRummyPlayerStat? activeRPS,
    InActiveRummyPlaterStat? inactiveRPS,
  }) {
    final _result = create();
    if (activeRPS != null) {
      _result.activeRPS = activeRPS;
    }
    if (inactiveRPS != null) {
      _result.inactiveRPS = inactiveRPS;
    }
    return _result;
  }
  factory RummyPlayerStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RummyPlayerStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RummyPlayerStat clone() => RummyPlayerStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RummyPlayerStat copyWith(void Function(RummyPlayerStat) updates) => super.copyWith((message) => updates(message as RummyPlayerStat)) as RummyPlayerStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RummyPlayerStat create() => RummyPlayerStat._();
  RummyPlayerStat createEmptyInstance() => create();
  static $pb.PbList<RummyPlayerStat> createRepeated() => $pb.PbList<RummyPlayerStat>();
  @$core.pragma('dart2js:noInline')
  static RummyPlayerStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RummyPlayerStat>(create);
  static RummyPlayerStat? _defaultInstance;

  RummyPlayerStat_Stat whichStat() => _RummyPlayerStat_StatByTag[$_whichOneof(0)]!;
  void clearStat() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ActiveRummyPlayerStat get activeRPS => $_getN(0);
  @$pb.TagNumber(1)
  set activeRPS(ActiveRummyPlayerStat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasActiveRPS() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveRPS() => clearField(1);
  @$pb.TagNumber(1)
  ActiveRummyPlayerStat ensureActiveRPS() => $_ensure(0);

  @$pb.TagNumber(2)
  InActiveRummyPlaterStat get inactiveRPS => $_getN(1);
  @$pb.TagNumber(2)
  set inactiveRPS(InActiveRummyPlaterStat v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInactiveRPS() => $_has(1);
  @$pb.TagNumber(2)
  void clearInactiveRPS() => clearField(2);
  @$pb.TagNumber(2)
  InActiveRummyPlaterStat ensureInactiveRPS() => $_ensure(1);
}

class ActiveRummyPlayerStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ActiveRummyPlayerStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..e<ARPAction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arpAction', $pb.PbFieldType.OE, protoName: 'arpAction', defaultOrMaker: ARPAction.DRAW_CARD, valueOf: ARPAction.valueOf, enumValues: ARPAction.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextCard', $pb.PbFieldType.O3, protoName: 'nextCard')
    ..hasRequiredFields = false
  ;

  ActiveRummyPlayerStat._() : super();
  factory ActiveRummyPlayerStat({
    ARPAction? arpAction,
    $core.int? nextCard,
  }) {
    final _result = create();
    if (arpAction != null) {
      _result.arpAction = arpAction;
    }
    if (nextCard != null) {
      _result.nextCard = nextCard;
    }
    return _result;
  }
  factory ActiveRummyPlayerStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveRummyPlayerStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveRummyPlayerStat clone() => ActiveRummyPlayerStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveRummyPlayerStat copyWith(void Function(ActiveRummyPlayerStat) updates) => super.copyWith((message) => updates(message as ActiveRummyPlayerStat)) as ActiveRummyPlayerStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActiveRummyPlayerStat create() => ActiveRummyPlayerStat._();
  ActiveRummyPlayerStat createEmptyInstance() => create();
  static $pb.PbList<ActiveRummyPlayerStat> createRepeated() => $pb.PbList<ActiveRummyPlayerStat>();
  @$core.pragma('dart2js:noInline')
  static ActiveRummyPlayerStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveRummyPlayerStat>(create);
  static ActiveRummyPlayerStat? _defaultInstance;

  @$pb.TagNumber(1)
  ARPAction get arpAction => $_getN(0);
  @$pb.TagNumber(1)
  set arpAction(ARPAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArpAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearArpAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nextCard => $_getIZ(1);
  @$pb.TagNumber(2)
  set nextCard($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextCard() => clearField(2);
}

class InActiveRummyPlaterStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InActiveRummyPlaterStat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activePlayerId', $pb.PbFieldType.O3, protoName: 'activePlayerId')
    ..hasRequiredFields = false
  ;

  InActiveRummyPlaterStat._() : super();
  factory InActiveRummyPlaterStat({
    $core.int? activePlayerId,
  }) {
    final _result = create();
    if (activePlayerId != null) {
      _result.activePlayerId = activePlayerId;
    }
    return _result;
  }
  factory InActiveRummyPlaterStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InActiveRummyPlaterStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InActiveRummyPlaterStat clone() => InActiveRummyPlaterStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InActiveRummyPlaterStat copyWith(void Function(InActiveRummyPlaterStat) updates) => super.copyWith((message) => updates(message as InActiveRummyPlaterStat)) as InActiveRummyPlaterStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InActiveRummyPlaterStat create() => InActiveRummyPlaterStat._();
  InActiveRummyPlaterStat createEmptyInstance() => create();
  static $pb.PbList<InActiveRummyPlaterStat> createRepeated() => $pb.PbList<InActiveRummyPlaterStat>();
  @$core.pragma('dart2js:noInline')
  static InActiveRummyPlaterStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InActiveRummyPlaterStat>(create);
  static InActiveRummyPlaterStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activePlayerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set activePlayerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivePlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivePlayerId() => clearField(1);
}

