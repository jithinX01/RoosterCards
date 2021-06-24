///
//  Generated code. Do not modify.
//  source: game_msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GameType extends $pb.ProtobufEnum {
  static const GameType RUMMY = GameType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RUMMY');
  static const GameType ACE_FLUSH = GameType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACE_FLUSH');
  static const GameType POKER = GameType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POKER');
  static const GameType MEMORY_GAME = GameType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEMORY_GAME');

  static const $core.List<GameType> values = <GameType> [
    RUMMY,
    ACE_FLUSH,
    POKER,
    MEMORY_GAME,
  ];

  static final $core.Map<$core.int, GameType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GameType? valueOf($core.int value) => _byValue[value];

  const GameType._($core.int v, $core.String n) : super(v, n);
}

class GPAction extends $pb.ProtobufEnum {
  static const GPAction DRAW = GPAction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DRAW');
  static const GPAction DISCARD = GPAction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISCARD');

  static const $core.List<GPAction> values = <GPAction> [
    DRAW,
    DISCARD,
  ];

  static final $core.Map<$core.int, GPAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GPAction? valueOf($core.int value) => _byValue[value];

  const GPAction._($core.int v, $core.String n) : super(v, n);
}

class TPAction extends $pb.ProtobufEnum {
  static const TPAction TAKE_BREAK = TPAction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TAKE_BREAK');
  static const TPAction NEXT_GAME = TPAction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEXT_GAME');

  static const $core.List<TPAction> values = <TPAction> [
    TAKE_BREAK,
    NEXT_GAME,
  ];

  static final $core.Map<$core.int, TPAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TPAction? valueOf($core.int value) => _byValue[value];

  const TPAction._($core.int v, $core.String n) : super(v, n);
}

