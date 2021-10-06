///
//  Generated code. Do not modify.
//  source: user_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDataDescriptor instead')
const UserData$json = const {
  '1': 'UserData',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'initDone', '3': 5, '4': 1, '5': 8, '10': 'initDone'},
    const {'1': 'trophyDir', '3': 6, '4': 1, '5': 9, '10': 'trophyDir'},
    const {'1': 'coins', '3': 7, '4': 1, '5': 5, '10': 'coins'},
  ],
};

/// Descriptor for `UserData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDataDescriptor = $convert.base64Decode('CghVc2VyRGF0YRISCgRuYW1lGAEgASgJUgRuYW1lEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBIUCgVlbWFpbBgEIAEoCVIFZW1haWwSGgoIaW5pdERvbmUYBSABKAhSCGluaXREb25lEhwKCXRyb3BoeURpchgGIAEoCVIJdHJvcGh5RGlyEhQKBWNvaW5zGAcgASgFUgVjb2lucw==');
@$core.Deprecated('Use trophyDataDescriptor instead')
const TrophyData$json = const {
  '1': 'TrophyData',
  '2': const [
    const {'1': 'tournamentName', '3': 1, '4': 1, '5': 9, '10': 'tournamentName'},
    const {'1': 'trophyId', '3': 2, '4': 1, '5': 5, '10': 'trophyId'},
    const {'1': 'shared', '3': 3, '4': 1, '5': 8, '10': 'shared'},
    const {'1': 'trophyWinners', '3': 4, '4': 3, '5': 9, '10': 'trophyWinners'},
  ],
};

/// Descriptor for `TrophyData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trophyDataDescriptor = $convert.base64Decode('CgpUcm9waHlEYXRhEiYKDnRvdXJuYW1lbnROYW1lGAEgASgJUg50b3VybmFtZW50TmFtZRIaCgh0cm9waHlJZBgCIAEoBVIIdHJvcGh5SWQSFgoGc2hhcmVkGAMgASgIUgZzaGFyZWQSJAoNdHJvcGh5V2lubmVycxgEIAMoCVINdHJvcGh5V2lubmVycw==');
