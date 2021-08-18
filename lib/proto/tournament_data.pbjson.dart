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
    const {'1': 'playerCards', '3': 6, '4': 3, '5': 11, '6': '.TournamentData.PlayerCardsEntry', '10': 'playerCards'},
    const {'1': 'currentPlayerId', '3': 7, '4': 1, '5': 5, '10': 'currentPlayerId'},
    const {'1': 'tournamentName', '3': 8, '4': 1, '5': 9, '10': 'tournamentName'},
    const {'1': 'trophyId', '3': 9, '4': 1, '5': 5, '10': 'trophyId'},
    const {'1': 'rummy_data', '3': 10, '4': 1, '5': 11, '6': '.RummyTournamentData', '9': 0, '10': 'rummyData'},
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
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.PlayerCard', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `TournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentDataDescriptor = $convert.base64Decode('Cg5Ub3VybmFtZW50RGF0YRIgCgtub09mUGxheWVycxgBIAEoBVILbm9PZlBsYXllcnMSHgoKbm9PZlJvdW5kcxgCIAEoBVIKbm9PZlJvdW5kcxIaCghub09mRGVjaxgDIAEoBVIIbm9PZkRlY2sSGAoHcGxheWVycxgEIAMoCVIHcGxheWVycxIcCgljYXJkU3RhY2sYBSADKAVSCWNhcmRTdGFjaxJCCgtwbGF5ZXJDYXJkcxgGIAMoCzIgLlRvdXJuYW1lbnREYXRhLlBsYXllckNhcmRzRW50cnlSC3BsYXllckNhcmRzEigKD2N1cnJlbnRQbGF5ZXJJZBgHIAEoBVIPY3VycmVudFBsYXllcklkEiYKDnRvdXJuYW1lbnROYW1lGAggASgJUg50b3VybmFtZW50TmFtZRIaCgh0cm9waHlJZBgJIAEoBVIIdHJvcGh5SWQSNQoKcnVtbXlfZGF0YRgKIAEoCzIULlJ1bW15VG91cm5hbWVudERhdGFIAFIJcnVtbXlEYXRhEiYKDmRpc2NhcmRlZENhcmRzGAsgAygFUg5kaXNjYXJkZWRDYXJkcxIiCgxjdXJyZW50Um91bmQYDCABKAVSDGN1cnJlbnRSb3VuZBIiCgx0b3VybmFtZW50SWQYDSABKAVSDHRvdXJuYW1lbnRJZBIaCghuZXh0Q2FyZBgOIAEoBVIIbmV4dENhcmQSIAoLcm91bmRXaW5uZXIYDyADKAVSC3JvdW5kV2lubmVyEhoKCHdpbkNvdW50GBAgAygFUgh3aW5Db3VudBIgCgttYXhXaW5Db3VudBgRIAEoBVILbWF4V2luQ291bnQSEgoEZG9uZRgSIAEoCFIEZG9uZRpLChBQbGF5ZXJDYXJkc0VudHJ5EhAKA2tleRgBIAEoBVIDa2V5EiEKBXZhbHVlGAIgASgLMgsuUGxheWVyQ2FyZFIFdmFsdWU6AjgBQgYKBHR5cGU=');
@$core.Deprecated('Use rummyTournamentDataDescriptor instead')
const RummyTournamentData$json = const {
  '1': 'RummyTournamentData',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.RummyState', '10': 'state'},
    const {'1': 'winCards', '3': 2, '4': 3, '5': 11, '6': '.AfterWinCards', '10': 'winCards'},
    const {'1': 'points', '3': 3, '4': 3, '5': 11, '6': '.RummyTournamentData.PointsEntry', '10': 'points'},
    const {'1': 'crPoints', '3': 4, '4': 3, '5': 11, '6': '.RummyTournamentData.CrPointsEntry', '10': 'crPoints'},
  ],
  '3': const [RummyTournamentData_PointsEntry$json, RummyTournamentData_CrPointsEntry$json],
};

@$core.Deprecated('Use rummyTournamentDataDescriptor instead')
const RummyTournamentData_PointsEntry$json = const {
  '1': 'PointsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use rummyTournamentDataDescriptor instead')
const RummyTournamentData_CrPointsEntry$json = const {
  '1': 'CrPointsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RummyTournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rummyTournamentDataDescriptor = $convert.base64Decode('ChNSdW1teVRvdXJuYW1lbnREYXRhEiEKBXN0YXRlGAEgASgOMgsuUnVtbXlTdGF0ZVIFc3RhdGUSKgoId2luQ2FyZHMYAiADKAsyDi5BZnRlcldpbkNhcmRzUgh3aW5DYXJkcxI4CgZwb2ludHMYAyADKAsyIC5SdW1teVRvdXJuYW1lbnREYXRhLlBvaW50c0VudHJ5UgZwb2ludHMSPgoIY3JQb2ludHMYBCADKAsyIi5SdW1teVRvdXJuYW1lbnREYXRhLkNyUG9pbnRzRW50cnlSCGNyUG9pbnRzGjkKC1BvaW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAEaOwoNQ3JQb2ludHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgB');
@$core.Deprecated('Use playerCardDescriptor instead')
const PlayerCard$json = const {
  '1': 'PlayerCard',
  '2': const [
    const {'1': 'cards', '3': 1, '4': 3, '5': 5, '10': 'cards'},
  ],
};

/// Descriptor for `PlayerCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerCardDescriptor = $convert.base64Decode('CgpQbGF5ZXJDYXJkEhQKBWNhcmRzGAEgAygFUgVjYXJkcw==');
@$core.Deprecated('Use afterWinCardsDescriptor instead')
const AfterWinCards$json = const {
  '1': 'AfterWinCards',
  '2': const [
    const {'1': 'playerCards', '3': 1, '4': 3, '5': 11, '6': '.AfterWinCards.PlayerCardsEntry', '10': 'playerCards'},
  ],
  '3': const [AfterWinCards_PlayerCardsEntry$json],
};

@$core.Deprecated('Use afterWinCardsDescriptor instead')
const AfterWinCards_PlayerCardsEntry$json = const {
  '1': 'PlayerCardsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.PlayerCard', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AfterWinCards`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List afterWinCardsDescriptor = $convert.base64Decode('Cg1BZnRlcldpbkNhcmRzEkEKC3BsYXllckNhcmRzGAEgAygLMh8uQWZ0ZXJXaW5DYXJkcy5QbGF5ZXJDYXJkc0VudHJ5UgtwbGF5ZXJDYXJkcxpLChBQbGF5ZXJDYXJkc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiEKBXZhbHVlGAIgASgLMgsuUGxheWVyQ2FyZFIFdmFsdWU6AjgB');
