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
  gameProgress, 
  tournamentProgress, 
  notSet
}

class GameMessageClient extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameMessageClient_PayLoad> _GameMessageClient_PayLoadByTag = {
    2 : GameMessageClient_PayLoad.initStart,
    3 : GameMessageClient_PayLoad.join,
    4 : GameMessageClient_PayLoad.gameProgress,
    5 : GameMessageClient_PayLoad.tournamentProgress,
    0 : GameMessageClient_PayLoad.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessageClient', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..aOM<InitStart>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initStart', protoName: 'initStart', subBuilder: InitStart.create)
    ..aOM<Join>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join', subBuilder: Join.create)
    ..aOM<GameProgress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameProgress', protoName: 'gameProgress', subBuilder: GameProgress.create)
    ..aOM<TournamentProgress>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentProgress', protoName: 'tournamentProgress', subBuilder: TournamentProgress.create)
    ..hasRequiredFields = false
  ;

  GameMessageClient._() : super();
  factory GameMessageClient({
    InitStart? initStart,
    Join? join,
    GameProgress? gameProgress,
    TournamentProgress? tournamentProgress,
  }) {
    final _result = create();
    if (initStart != null) {
      _result.initStart = initStart;
    }
    if (join != null) {
      _result.join = join;
    }
    if (gameProgress != null) {
      _result.gameProgress = gameProgress;
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
  GameProgress get gameProgress => $_getN(2);
  @$pb.TagNumber(4)
  set gameProgress(GameProgress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameProgress() => $_has(2);
  @$pb.TagNumber(4)
  void clearGameProgress() => clearField(4);
  @$pb.TagNumber(4)
  GameProgress ensureGameProgress() => $_ensure(2);

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

class GameProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameProgress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..e<GPAction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: GPAction.DRAW, valueOf: GPAction.valueOf, enumValues: GPAction.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', $pb.PbFieldType.O3, protoName: 'playerId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newCard', $pb.PbFieldType.O3, protoName: 'newCard')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldCard', $pb.PbFieldType.O3, protoName: 'oldCard')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentId', $pb.PbFieldType.O3, protoName: 'tournamentId')
    ..hasRequiredFields = false
  ;

  GameProgress._() : super();
  factory GameProgress({
    GPAction? action,
    $core.int? playerId,
    $core.int? newCard,
    $core.int? oldCard,
    $core.int? tournamentId,
  }) {
    final _result = create();
    if (action != null) {
      _result.action = action;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (newCard != null) {
      _result.newCard = newCard;
    }
    if (oldCard != null) {
      _result.oldCard = oldCard;
    }
    if (tournamentId != null) {
      _result.tournamentId = tournamentId;
    }
    return _result;
  }
  factory GameProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameProgress clone() => GameProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameProgress copyWith(void Function(GameProgress) updates) => super.copyWith((message) => updates(message as GameProgress)) as GameProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameProgress create() => GameProgress._();
  GameProgress createEmptyInstance() => create();
  static $pb.PbList<GameProgress> createRepeated() => $pb.PbList<GameProgress>();
  @$core.pragma('dart2js:noInline')
  static GameProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameProgress>(create);
  static GameProgress? _defaultInstance;

  @$pb.TagNumber(1)
  GPAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(GPAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get playerId => $_getIZ(1);
  @$pb.TagNumber(2)
  set playerId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get newCard => $_getIZ(2);
  @$pb.TagNumber(3)
  set newCard($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewCard() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewCard() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get oldCard => $_getIZ(3);
  @$pb.TagNumber(4)
  set oldCard($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOldCard() => $_has(3);
  @$pb.TagNumber(4)
  void clearOldCard() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get tournamentId => $_getIZ(4);
  @$pb.TagNumber(5)
  set tournamentId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTournamentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTournamentId() => clearField(5);
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
  notSet
}

class GameMessageServer extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameMessageServer_PayLoad> _GameMessageServer_PayLoadByTag = {
    2 : GameMessageServer_PayLoad.initStartStat,
    3 : GameMessageServer_PayLoad.joinStat,
    4 : GameMessageServer_PayLoad.joinProgress,
    5 : GameMessageServer_PayLoad.startTournament,
    0 : GameMessageServer_PayLoad.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessageServer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'game_message'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..aOM<InitStartStat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initStartStat', protoName: 'initStartStat', subBuilder: InitStartStat.create)
    ..aOM<JoinStat>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joinStat', protoName: 'joinStat', subBuilder: JoinStat.create)
    ..aOM<JoinProgress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joinProgress', protoName: 'joinProgress', subBuilder: JoinProgress.create)
    ..aOM<StartTournament>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTournament', protoName: 'startTournament', subBuilder: StartTournament.create)
    ..hasRequiredFields = false
  ;

  GameMessageServer._() : super();
  factory GameMessageServer({
    InitStartStat? initStartStat,
    JoinStat? joinStat,
    JoinProgress? joinProgress,
    StartTournament? startTournament,
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
    ..hasRequiredFields = false
  ;

  StartTournament._() : super();
  factory StartTournament({
    $core.Map<$core.int, $core.String>? playerMap,
    $core.Iterable<$core.int>? cards,
    $core.bool? youStart,
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
}

