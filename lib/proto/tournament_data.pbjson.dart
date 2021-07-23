///
//  Generated code. Do not modify.
//  source: tournament_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use rummyStateDescriptor instead')
const RummyState$json = const {
  '1': 'RummyState',
  '2': const [
    const {'1': 'INIT', '2': 0},
    const {'1': 'IN_PROGRESS', '2': 1},
    const {'1': 'BREAK', '2': 2},
    const {'1': 'END', '2': 3},
  ],
};

/// Descriptor for `RummyState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rummyStateDescriptor = $convert.base64Decode('CgpSdW1teVN0YXRlEggKBElOSVQQABIPCgtJTl9QUk9HUkVTUxABEgkKBUJSRUFLEAISBwoDRU5EEAM=');
@$core.Deprecated('Use tournamentDataDescriptor instead')
const TournamentData$json = const {
  '1': 'TournamentData',
  '2': const [
    const {'1': 'noOfPlayers', '3': 1, '4': 1, '5': 5, '10': 'noOfPlayers'},
    const {'1': 'noOfRounds', '3': 2, '4': 1, '5': 5, '10': 'noOfRounds'},
    const {'1': 'noOfDeck', '3': 3, '4': 1, '5': 5, '10': 'noOfDeck'},
    const {'1': 'players', '3': 4, '4': 3, '5': 9, '10': 'players'},
    const {'1': 'cardStack', '3': 5, '4': 3, '5': 5, '10': 'cardStack'},
    const {'1': 'playerCards', '3': 6, '4': 3, '5': 11, '6': '.rummy_data.TournamentData.PlayerCardsEntry', '10': 'playerCards'},
    const {'1': 'currentPlayerId', '3': 7, '4': 1, '5': 5, '10': 'currentPlayerId'},
    const {'1': 'tournamentName', '3': 8, '4': 1, '5': 9, '10': 'tournamentName'},
    const {'1': 'trophyId', '3': 9, '4': 1, '5': 5, '10': 'trophyId'},
    const {'1': 'rummy_data', '3': 10, '4': 1, '5': 11, '6': '.rummy_data.RummyTournamentData', '9': 0, '10': 'rummyData'},
    const {'1': 'discardedCards', '3': 11, '4': 3, '5': 5, '10': 'discardedCards'},
    const {'1': 'currentRound', '3': 12, '4': 1, '5': 5, '10': 'currentRound'},
    const {'1': 'tournamentId', '3': 13, '4': 1, '5': 5, '10': 'tournamentId'},
    const {'1': 'nextCard', '3': 14, '4': 1, '5': 5, '10': 'nextCard'},
    const {'1': 'roundWinner', '3': 15, '4': 3, '5': 5, '10': 'roundWinner'},
    const {'1': 'winCount', '3': 16, '4': 3, '5': 5, '10': 'winCount'},
    const {'1': 'maxWinCount', '3': 17, '4': 1, '5': 5, '10': 'maxWinCount'},
    const {'1': 'done', '3': 18, '4': 1, '5': 8, '10': 'done'},
  ],
  '3': const [TournamentData_PlayerCardsEntry$json],
  '8': const [
    const {'1': 'type'},
  ],
};

@$core.Deprecated('Use tournamentDataDescriptor instead')
const TournamentData_PlayerCardsEntry$json = const {
  '1': 'PlayerCardsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.rummy_data.PlayerCard', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `TournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentDataDescriptor = $convert.base64Decode('Cg5Ub3VybmFtZW50RGF0YRIgCgtub09mUGxheWVycxgBIAEoBVILbm9PZlBsYXllcnMSHgoKbm9PZlJvdW5kcxgCIAEoBVIKbm9PZlJvdW5kcxIaCghub09mRGVjaxgDIAEoBVIIbm9PZkRlY2sSGAoHcGxheWVycxgEIAMoCVIHcGxheWVycxIcCgljYXJkU3RhY2sYBSADKAVSCWNhcmRTdGFjaxJNCgtwbGF5ZXJDYXJkcxgGIAMoCzIrLnJ1bW15X2RhdGEuVG91cm5hbWVudERhdGEuUGxheWVyQ2FyZHNFbnRyeVILcGxheWVyQ2FyZHMSKAoPY3VycmVudFBsYXllcklkGAcgASgFUg9jdXJyZW50UGxheWVySWQSJgoOdG91cm5hbWVudE5hbWUYCCABKAlSDnRvdXJuYW1lbnROYW1lEhoKCHRyb3BoeUlkGAkgASgFUgh0cm9waHlJZBJACgpydW1teV9kYXRhGAogASgLMh8ucnVtbXlfZGF0YS5SdW1teVRvdXJuYW1lbnREYXRhSABSCXJ1bW15RGF0YRImCg5kaXNjYXJkZWRDYXJkcxgLIAMoBVIOZGlzY2FyZGVkQ2FyZHMSIgoMY3VycmVudFJvdW5kGAwgASgFUgxjdXJyZW50Um91bmQSIgoMdG91cm5hbWVudElkGA0gASgFUgx0b3VybmFtZW50SWQSGgoIbmV4dENhcmQYDiABKAVSCG5leHRDYXJkEiAKC3JvdW5kV2lubmVyGA8gAygFUgtyb3VuZFdpbm5lchIaCgh3aW5Db3VudBgQIAMoBVIId2luQ291bnQSIAoLbWF4V2luQ291bnQYESABKAVSC21heFdpbkNvdW50EhIKBGRvbmUYEiABKAhSBGRvbmUaVgoQUGxheWVyQ2FyZHNFbnRyeRIQCgNrZXkYASABKAVSA2tleRIsCgV2YWx1ZRgCIAEoCzIWLnJ1bW15X2RhdGEuUGxheWVyQ2FyZFIFdmFsdWU6AjgBQgYKBHR5cGU=');
@$core.Deprecated('Use rummyTournamentDataDescriptor instead')
const RummyTournamentData$json = const {
  '1': 'RummyTournamentData',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.rummy_data.RummyState', '10': 'state'},
  ],
};

/// Descriptor for `RummyTournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rummyTournamentDataDescriptor = $convert.base64Decode('ChNSdW1teVRvdXJuYW1lbnREYXRhEiwKBXN0YXRlGAEgASgOMhYucnVtbXlfZGF0YS5SdW1teVN0YXRlUgVzdGF0ZQ==');
@$core.Deprecated('Use playerCardDescriptor instead')
const PlayerCard$json = const {
  '1': 'PlayerCard',
  '2': const [
    const {'1': 'cards', '3': 1, '4': 3, '5': 5, '10': 'cards'},
  ],
};

/// Descriptor for `PlayerCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerCardDescriptor = $convert.base64Decode('CgpQbGF5ZXJDYXJkEhQKBWNhcmRzGAEgAygFUgVjYXJkcw==');
