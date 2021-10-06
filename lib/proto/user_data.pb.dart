///
//  Generated code. Do not modify.
//  source: user_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user_data'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initDone', protoName: 'initDone')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyDir', protoName: 'trophyDir')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coins', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UserData._() : super();
  factory UserData({
    $core.String? name,
    $core.String? userId,
    $core.String? password,
    $core.String? email,
    $core.bool? initDone,
    $core.String? trophyDir,
    $core.int? coins,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (password != null) {
      _result.password = password;
    }
    if (email != null) {
      _result.email = email;
    }
    if (initDone != null) {
      _result.initDone = initDone;
    }
    if (trophyDir != null) {
      _result.trophyDir = trophyDir;
    }
    if (coins != null) {
      _result.coins = coins;
    }
    return _result;
  }
  factory UserData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserData clone() => UserData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserData copyWith(void Function(UserData) updates) => super.copyWith((message) => updates(message as UserData)) as UserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserData create() => UserData._();
  UserData createEmptyInstance() => create();
  static $pb.PbList<UserData> createRepeated() => $pb.PbList<UserData>();
  @$core.pragma('dart2js:noInline')
  static UserData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserData>(create);
  static UserData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get initDone => $_getBF(4);
  @$pb.TagNumber(5)
  set initDone($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInitDone() => $_has(4);
  @$pb.TagNumber(5)
  void clearInitDone() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get trophyDir => $_getSZ(5);
  @$pb.TagNumber(6)
  set trophyDir($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrophyDir() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrophyDir() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get coins => $_getIZ(6);
  @$pb.TagNumber(7)
  set coins($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCoins() => $_has(6);
  @$pb.TagNumber(7)
  void clearCoins() => clearField(7);
}

class TrophyData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrophyData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user_data'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournamentName', protoName: 'tournamentName')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyId', $pb.PbFieldType.O3, protoName: 'trophyId')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shared')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trophyWinners', protoName: 'trophyWinners')
    ..hasRequiredFields = false
  ;

  TrophyData._() : super();
  factory TrophyData({
    $core.String? tournamentName,
    $core.int? trophyId,
    $core.bool? shared,
    $core.Iterable<$core.String>? trophyWinners,
  }) {
    final _result = create();
    if (tournamentName != null) {
      _result.tournamentName = tournamentName;
    }
    if (trophyId != null) {
      _result.trophyId = trophyId;
    }
    if (shared != null) {
      _result.shared = shared;
    }
    if (trophyWinners != null) {
      _result.trophyWinners.addAll(trophyWinners);
    }
    return _result;
  }
  factory TrophyData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrophyData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrophyData clone() => TrophyData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrophyData copyWith(void Function(TrophyData) updates) => super.copyWith((message) => updates(message as TrophyData)) as TrophyData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrophyData create() => TrophyData._();
  TrophyData createEmptyInstance() => create();
  static $pb.PbList<TrophyData> createRepeated() => $pb.PbList<TrophyData>();
  @$core.pragma('dart2js:noInline')
  static TrophyData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrophyData>(create);
  static TrophyData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tournamentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set tournamentName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTournamentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTournamentName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get trophyId => $_getIZ(1);
  @$pb.TagNumber(2)
  set trophyId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrophyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrophyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get shared => $_getBF(2);
  @$pb.TagNumber(3)
  set shared($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShared() => $_has(2);
  @$pb.TagNumber(3)
  void clearShared() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get trophyWinners => $_getList(3);
}

