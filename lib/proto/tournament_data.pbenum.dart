///
//  Generated code. Do not modify.
//  source: tournament_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RummyState extends $pb.ProtobufEnum {
  static const RummyState INIT = RummyState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INIT');
  static const RummyState IN_PROGRESS = RummyState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_PROGRESS');
  static const RummyState BREAK = RummyState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BREAK');
  static const RummyState END = RummyState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'END');

  static const $core.List<RummyState> values = <RummyState> [
    INIT,
    IN_PROGRESS,
    BREAK,
    END,
  ];

  static final $core.Map<$core.int, RummyState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RummyState? valueOf($core.int value) => _byValue[value];

  const RummyState._($core.int v, $core.String n) : super(v, n);
}

