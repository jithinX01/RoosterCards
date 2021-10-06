///
//  Generated code. Do not modify.
//  source: game_msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use gameTypeDescriptor instead')
const GameType$json = const {
  '1': 'GameType',
  '2': const [
    const {'1': 'RUMMY', '2': 0},
    const {'1': 'ACE_FLUSH', '2': 1},
    const {'1': 'POKER', '2': 2},
    const {'1': 'MEMORY_GAME', '2': 3},
  ],
};

/// Descriptor for `GameType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gameTypeDescriptor = $convert.base64Decode('CghHYW1lVHlwZRIJCgVSVU1NWRAAEg0KCUFDRV9GTFVTSBABEgkKBVBPS0VSEAISDwoLTUVNT1JZX0dBTUUQAw==');
@$core.Deprecated('Use tPActionDescriptor instead')
const TPAction$json = const {
  '1': 'TPAction',
  '2': const [
    const {'1': 'TAKE_BREAK', '2': 0},
    const {'1': 'NEXT_GAME', '2': 1},
  ],
};

/// Descriptor for `TPAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tPActionDescriptor = $convert.base64Decode('CghUUEFjdGlvbhIOCgpUQUtFX0JSRUFLEAASDQoJTkVYVF9HQU1FEAE=');
@$core.Deprecated('Use aRPActionDescriptor instead')
const ARPAction$json = const {
  '1': 'ARPAction',
  '2': const [
    const {'1': 'DRAW_CARD', '2': 0},
    const {'1': 'DROP_CARD', '2': 1},
  ],
};

/// Descriptor for `ARPAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List aRPActionDescriptor = $convert.base64Decode('CglBUlBBY3Rpb24SDQoJRFJBV19DQVJEEAASDQoJRFJPUF9DQVJEEAE=');
@$core.Deprecated('Use gameMessageClientDescriptor instead')
const GameMessageClient$json = const {
  '1': 'GameMessageClient',
  '2': const [
    const {'1': 'initStart', '3': 2, '4': 1, '5': 11, '6': '.game_message.InitStart', '9': 0, '10': 'initStart'},
    const {'1': 'join', '3': 3, '4': 1, '5': 11, '6': '.game_message.Join', '9': 0, '10': 'join'},
    const {'1': 'clientGameStat', '3': 4, '4': 1, '5': 11, '6': '.game_message.ClientGameStat', '9': 0, '10': 'clientGameStat'},
    const {'1': 'tournamentProgress', '3': 5, '4': 1, '5': 11, '6': '.game_message.TournamentProgress', '9': 0, '10': 'tournamentProgress'},
  ],
  '8': const [
    const {'1': 'pay_load'},
  ],
};

/// Descriptor for `GameMessageClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameMessageClientDescriptor = $convert.base64Decode('ChFHYW1lTWVzc2FnZUNsaWVudBI3Cglpbml0U3RhcnQYAiABKAsyFy5nYW1lX21lc3NhZ2UuSW5pdFN0YXJ0SABSCWluaXRTdGFydBIoCgRqb2luGAMgASgLMhIuZ2FtZV9tZXNzYWdlLkpvaW5IAFIEam9pbhJGCg5jbGllbnRHYW1lU3RhdBgEIAEoCzIcLmdhbWVfbWVzc2FnZS5DbGllbnRHYW1lU3RhdEgAUg5jbGllbnRHYW1lU3RhdBJSChJ0b3VybmFtZW50UHJvZ3Jlc3MYBSABKAsyIC5nYW1lX21lc3NhZ2UuVG91cm5hbWVudFByb2dyZXNzSABSEnRvdXJuYW1lbnRQcm9ncmVzc0IKCghwYXlfbG9hZA==');
@$core.Deprecated('Use initStartDescriptor instead')
const InitStart$json = const {
  '1': 'InitStart',
  '2': const [
    const {'1': 'gameType', '3': 1, '4': 1, '5': 14, '6': '.game_message.GameType', '10': 'gameType'},
    const {'1': 'playerName', '3': 2, '4': 1, '5': 9, '10': 'playerName'},
    const {'1': 'tournamentName', '3': 3, '4': 1, '5': 9, '10': 'tournamentName'},
    const {'1': 'noOfDeck', '3': 4, '4': 1, '5': 5, '10': 'noOfDeck'},
    const {'1': 'noOfPlayers', '3': 5, '4': 1, '5': 5, '10': 'noOfPlayers'},
    const {'1': 'noOfRounds', '3': 6, '4': 1, '5': 5, '10': 'noOfRounds'},
    const {'1': 'trophyId', '3': 7, '4': 1, '5': 5, '10': 'trophyId'},
    const {'1': 'coins', '3': 8, '4': 1, '5': 5, '10': 'coins'},
    const {'1': 'rummyInitData', '3': 10, '4': 1, '5': 11, '6': '.game_message.RummyInitData', '9': 0, '10': 'rummyInitData'},
  ],
  '8': const [
    const {'1': 'gameTypeInit'},
  ],
};

/// Descriptor for `InitStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initStartDescriptor = $convert.base64Decode('CglJbml0U3RhcnQSMgoIZ2FtZVR5cGUYASABKA4yFi5nYW1lX21lc3NhZ2UuR2FtZVR5cGVSCGdhbWVUeXBlEh4KCnBsYXllck5hbWUYAiABKAlSCnBsYXllck5hbWUSJgoOdG91cm5hbWVudE5hbWUYAyABKAlSDnRvdXJuYW1lbnROYW1lEhoKCG5vT2ZEZWNrGAQgASgFUghub09mRGVjaxIgCgtub09mUGxheWVycxgFIAEoBVILbm9PZlBsYXllcnMSHgoKbm9PZlJvdW5kcxgGIAEoBVIKbm9PZlJvdW5kcxIaCgh0cm9waHlJZBgHIAEoBVIIdHJvcGh5SWQSFAoFY29pbnMYCCABKAVSBWNvaW5zEkMKDXJ1bW15SW5pdERhdGEYCiABKAsyGy5nYW1lX21lc3NhZ2UuUnVtbXlJbml0RGF0YUgAUg1ydW1teUluaXREYXRhQg4KDGdhbWVUeXBlSW5pdA==');
@$core.Deprecated('Use rummyInitDataDescriptor instead')
const RummyInitData$json = const {
  '1': 'RummyInitData',
  '2': const [
    const {'1': 'maxPointGame', '3': 1, '4': 1, '5': 8, '10': 'maxPointGame'},
    const {'1': 'maxPoint', '3': 2, '4': 1, '5': 5, '10': 'maxPoint'},
  ],
};

/// Descriptor for `RummyInitData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rummyInitDataDescriptor = $convert.base64Decode('Cg1SdW1teUluaXREYXRhEiIKDG1heFBvaW50R2FtZRgBIAEoCFIMbWF4UG9pbnRHYW1lEhoKCG1heFBvaW50GAIgASgFUghtYXhQb2ludA==');
@$core.Deprecated('Use joinDescriptor instead')
const Join$json = const {
  '1': 'Join',
  '2': const [
    const {'1': 'playerName', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
    const {'1': 'tournamentId', '3': 2, '4': 1, '5': 5, '10': 'tournamentId'},
  ],
};

/// Descriptor for `Join`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinDescriptor = $convert.base64Decode('CgRKb2luEh4KCnBsYXllck5hbWUYASABKAlSCnBsYXllck5hbWUSIgoMdG91cm5hbWVudElkGAIgASgFUgx0b3VybmFtZW50SWQ=');
@$core.Deprecated('Use discardCardDescriptor instead')
const DiscardCard$json = const {
  '1': 'DiscardCard',
  '2': const [
    const {'1': 'card', '3': 1, '4': 1, '5': 5, '10': 'card'},
  ],
};

/// Descriptor for `DiscardCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discardCardDescriptor = $convert.base64Decode('CgtEaXNjYXJkQ2FyZBISCgRjYXJkGAEgASgFUgRjYXJk');
@$core.Deprecated('Use drawCardDescriptor instead')
const DrawCard$json = const {
  '1': 'DrawCard',
  '2': const [
    const {'1': 'newCard', '3': 1, '4': 1, '5': 5, '10': 'newCard'},
    const {'1': 'oldCard', '3': 2, '4': 1, '5': 5, '10': 'oldCard'},
  ],
};

/// Descriptor for `DrawCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drawCardDescriptor = $convert.base64Decode('CghEcmF3Q2FyZBIYCgduZXdDYXJkGAEgASgFUgduZXdDYXJkEhgKB29sZENhcmQYAiABKAVSB29sZENhcmQ=');
@$core.Deprecated('Use clientGameStatDescriptor instead')
const ClientGameStat$json = const {
  '1': 'ClientGameStat',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
    const {'1': 'tournamentId', '3': 2, '4': 1, '5': 5, '10': 'tournamentId'},
    const {'1': 'drawCard', '3': 3, '4': 1, '5': 11, '6': '.game_message.DrawCard', '9': 0, '10': 'drawCard'},
    const {'1': 'discardCard', '3': 4, '4': 1, '5': 11, '6': '.game_message.DiscardCard', '9': 0, '10': 'discardCard'},
  ],
  '8': const [
    const {'1': 'stat'},
  ],
};

/// Descriptor for `ClientGameStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientGameStatDescriptor = $convert.base64Decode('Cg5DbGllbnRHYW1lU3RhdBIaCghwbGF5ZXJJZBgBIAEoBVIIcGxheWVySWQSIgoMdG91cm5hbWVudElkGAIgASgFUgx0b3VybmFtZW50SWQSNAoIZHJhd0NhcmQYAyABKAsyFi5nYW1lX21lc3NhZ2UuRHJhd0NhcmRIAFIIZHJhd0NhcmQSPQoLZGlzY2FyZENhcmQYBCABKAsyGS5nYW1lX21lc3NhZ2UuRGlzY2FyZENhcmRIAFILZGlzY2FyZENhcmRCBgoEc3RhdA==');
@$core.Deprecated('Use tournamentProgressDescriptor instead')
const TournamentProgress$json = const {
  '1': 'TournamentProgress',
  '2': const [
    const {'1': 'action', '3': 1, '4': 1, '5': 14, '6': '.game_message.TPAction', '10': 'action'},
    const {'1': 'breakTime', '3': 2, '4': 1, '5': 5, '10': 'breakTime'},
  ],
};

/// Descriptor for `TournamentProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentProgressDescriptor = $convert.base64Decode('ChJUb3VybmFtZW50UHJvZ3Jlc3MSLgoGYWN0aW9uGAEgASgOMhYuZ2FtZV9tZXNzYWdlLlRQQWN0aW9uUgZhY3Rpb24SHAoJYnJlYWtUaW1lGAIgASgFUglicmVha1RpbWU=');
@$core.Deprecated('Use gameMessageServerDescriptor instead')
const GameMessageServer$json = const {
  '1': 'GameMessageServer',
  '2': const [
    const {'1': 'initStartStat', '3': 2, '4': 1, '5': 11, '6': '.game_message.InitStartStat', '9': 0, '10': 'initStartStat'},
    const {'1': 'joinStat', '3': 3, '4': 1, '5': 11, '6': '.game_message.JoinStat', '9': 0, '10': 'joinStat'},
    const {'1': 'joinProgress', '3': 4, '4': 1, '5': 11, '6': '.game_message.JoinProgress', '9': 0, '10': 'joinProgress'},
    const {'1': 'startTournament', '3': 5, '4': 1, '5': 11, '6': '.game_message.StartTournament', '9': 0, '10': 'startTournament'},
    const {'1': 'gameServerUpdate', '3': 6, '4': 1, '5': 11, '6': '.game_message.GameServerUpdate', '9': 0, '10': 'gameServerUpdate'},
    const {'1': 'errorStat', '3': 7, '4': 1, '5': 11, '6': '.game_message.ErrorStat', '9': 0, '10': 'errorStat'},
    const {'1': 'tournamentOver', '3': 8, '4': 1, '5': 11, '6': '.game_message.TournamentOver', '9': 0, '10': 'tournamentOver'},
  ],
  '8': const [
    const {'1': 'pay_load'},
  ],
};

/// Descriptor for `GameMessageServer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameMessageServerDescriptor = $convert.base64Decode('ChFHYW1lTWVzc2FnZVNlcnZlchJDCg1pbml0U3RhcnRTdGF0GAIgASgLMhsuZ2FtZV9tZXNzYWdlLkluaXRTdGFydFN0YXRIAFINaW5pdFN0YXJ0U3RhdBI0Cghqb2luU3RhdBgDIAEoCzIWLmdhbWVfbWVzc2FnZS5Kb2luU3RhdEgAUghqb2luU3RhdBJACgxqb2luUHJvZ3Jlc3MYBCABKAsyGi5nYW1lX21lc3NhZ2UuSm9pblByb2dyZXNzSABSDGpvaW5Qcm9ncmVzcxJJCg9zdGFydFRvdXJuYW1lbnQYBSABKAsyHS5nYW1lX21lc3NhZ2UuU3RhcnRUb3VybmFtZW50SABSD3N0YXJ0VG91cm5hbWVudBJMChBnYW1lU2VydmVyVXBkYXRlGAYgASgLMh4uZ2FtZV9tZXNzYWdlLkdhbWVTZXJ2ZXJVcGRhdGVIAFIQZ2FtZVNlcnZlclVwZGF0ZRI3CgllcnJvclN0YXQYByABKAsyFy5nYW1lX21lc3NhZ2UuRXJyb3JTdGF0SABSCWVycm9yU3RhdBJGCg50b3VybmFtZW50T3ZlchgIIAEoCzIcLmdhbWVfbWVzc2FnZS5Ub3VybmFtZW50T3ZlckgAUg50b3VybmFtZW50T3ZlckIKCghwYXlfbG9hZA==');
@$core.Deprecated('Use errorStatDescriptor instead')
const ErrorStat$json = const {
  '1': 'ErrorStat',
  '2': const [
    const {'1': 'errorCode', '3': 1, '4': 1, '5': 5, '10': 'errorCode'},
    const {'1': 'errorMessage', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `ErrorStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorStatDescriptor = $convert.base64Decode('CglFcnJvclN0YXQSHAoJZXJyb3JDb2RlGAEgASgFUgllcnJvckNvZGUSIgoMZXJyb3JNZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use initStartStatDescriptor instead')
const InitStartStat$json = const {
  '1': 'InitStartStat',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
    const {'1': 'tournamentId', '3': 2, '4': 1, '5': 5, '10': 'tournamentId'},
  ],
};

/// Descriptor for `InitStartStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initStartStatDescriptor = $convert.base64Decode('Cg1Jbml0U3RhcnRTdGF0EhoKCHBsYXllcklkGAEgASgFUghwbGF5ZXJJZBIiCgx0b3VybmFtZW50SWQYAiABKAVSDHRvdXJuYW1lbnRJZA==');
@$core.Deprecated('Use joinStatDescriptor instead')
const JoinStat$json = const {
  '1': 'JoinStat',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
  ],
};

/// Descriptor for `JoinStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinStatDescriptor = $convert.base64Decode('CghKb2luU3RhdBIaCghwbGF5ZXJJZBgBIAEoBVIIcGxheWVySWQ=');
@$core.Deprecated('Use joinProgressDescriptor instead')
const JoinProgress$json = const {
  '1': 'JoinProgress',
  '2': const [
    const {'1': 'players', '3': 1, '4': 3, '5': 9, '10': 'players'},
  ],
};

/// Descriptor for `JoinProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinProgressDescriptor = $convert.base64Decode('CgxKb2luUHJvZ3Jlc3MSGAoHcGxheWVycxgBIAMoCVIHcGxheWVycw==');
@$core.Deprecated('Use startTournamentDescriptor instead')
const StartTournament$json = const {
  '1': 'StartTournament',
  '2': const [
    const {'1': 'playerMap', '3': 1, '4': 3, '5': 11, '6': '.game_message.StartTournament.PlayerMapEntry', '10': 'playerMap'},
    const {'1': 'cards', '3': 2, '4': 3, '5': 5, '10': 'cards'},
    const {'1': 'youStart', '3': 3, '4': 1, '5': 8, '10': 'youStart'},
    const {'1': 'activePlayerId', '3': 4, '4': 1, '5': 5, '10': 'activePlayerId'},
    const {'1': 'round', '3': 5, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'tournamentName', '3': 6, '4': 1, '5': 9, '10': 'tournamentName'},
    const {'1': 'trophyId', '3': 7, '4': 1, '5': 5, '10': 'trophyId'},
    const {'1': 'yourId', '3': 8, '4': 1, '5': 5, '10': 'yourId'},
    const {'1': 'nextCard', '3': 9, '4': 1, '5': 5, '10': 'nextCard'},
    const {'1': 'tournamentId', '3': 10, '4': 1, '5': 5, '10': 'tournamentId'},
  ],
  '3': const [StartTournament_PlayerMapEntry$json],
};

@$core.Deprecated('Use startTournamentDescriptor instead')
const StartTournament_PlayerMapEntry$json = const {
  '1': 'PlayerMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `StartTournament`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTournamentDescriptor = $convert.base64Decode('Cg9TdGFydFRvdXJuYW1lbnQSSgoJcGxheWVyTWFwGAEgAygLMiwuZ2FtZV9tZXNzYWdlLlN0YXJ0VG91cm5hbWVudC5QbGF5ZXJNYXBFbnRyeVIJcGxheWVyTWFwEhQKBWNhcmRzGAIgAygFUgVjYXJkcxIaCgh5b3VTdGFydBgDIAEoCFIIeW91U3RhcnQSJgoOYWN0aXZlUGxheWVySWQYBCABKAVSDmFjdGl2ZVBsYXllcklkEhQKBXJvdW5kGAUgASgFUgVyb3VuZBImCg50b3VybmFtZW50TmFtZRgGIAEoCVIOdG91cm5hbWVudE5hbWUSGgoIdHJvcGh5SWQYByABKAVSCHRyb3BoeUlkEhYKBnlvdXJJZBgIIAEoBVIGeW91cklkEhoKCG5leHRDYXJkGAkgASgFUghuZXh0Q2FyZBIiCgx0b3VybmFtZW50SWQYCiABKAVSDHRvdXJuYW1lbnRJZBo8Cg5QbGF5ZXJNYXBFbnRyeRIQCgNrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use gameServerUpdateDescriptor instead')
const GameServerUpdate$json = const {
  '1': 'GameServerUpdate',
  '2': const [
    const {'1': 'rummyPlayerStat', '3': 1, '4': 1, '5': 11, '6': '.game_message.RummyPlayerStat', '9': 0, '10': 'rummyPlayerStat'},
  ],
  '8': const [
    const {'1': 'update'},
  ],
};

/// Descriptor for `GameServerUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameServerUpdateDescriptor = $convert.base64Decode('ChBHYW1lU2VydmVyVXBkYXRlEkkKD3J1bW15UGxheWVyU3RhdBgBIAEoCzIdLmdhbWVfbWVzc2FnZS5SdW1teVBsYXllclN0YXRIAFIPcnVtbXlQbGF5ZXJTdGF0QggKBnVwZGF0ZQ==');
@$core.Deprecated('Use rummyPlayerStatDescriptor instead')
const RummyPlayerStat$json = const {
  '1': 'RummyPlayerStat',
  '2': const [
    const {'1': 'activeRPS', '3': 1, '4': 1, '5': 11, '6': '.game_message.ActiveRummyPlayerStat', '9': 0, '10': 'activeRPS'},
    const {'1': 'inactiveRPS', '3': 2, '4': 1, '5': 11, '6': '.game_message.InActiveRummyPlaterStat', '9': 0, '10': 'inactiveRPS'},
    const {'1': 'WonPlayerStat', '3': 3, '4': 1, '5': 11, '6': '.game_message.WonPlayerStat', '9': 0, '10': 'WonPlayerStat'},
    const {'1': 'LosePlayerStat', '3': 4, '4': 1, '5': 11, '6': '.game_message.LosePlayerStat', '9': 0, '10': 'LosePlayerStat'},
    const {'1': 'NextGame', '3': 5, '4': 1, '5': 11, '6': '.game_message.NextGame', '9': 0, '10': 'NextGame'},
    const {'1': 'Eliminated', '3': 6, '4': 1, '5': 11, '6': '.game_message.Eliminated', '9': 0, '10': 'Eliminated'},
  ],
  '8': const [
    const {'1': 'stat'},
  ],
};

/// Descriptor for `RummyPlayerStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rummyPlayerStatDescriptor = $convert.base64Decode('Cg9SdW1teVBsYXllclN0YXQSQwoJYWN0aXZlUlBTGAEgASgLMiMuZ2FtZV9tZXNzYWdlLkFjdGl2ZVJ1bW15UGxheWVyU3RhdEgAUglhY3RpdmVSUFMSSQoLaW5hY3RpdmVSUFMYAiABKAsyJS5nYW1lX21lc3NhZ2UuSW5BY3RpdmVSdW1teVBsYXRlclN0YXRIAFILaW5hY3RpdmVSUFMSQwoNV29uUGxheWVyU3RhdBgDIAEoCzIbLmdhbWVfbWVzc2FnZS5Xb25QbGF5ZXJTdGF0SABSDVdvblBsYXllclN0YXQSRgoOTG9zZVBsYXllclN0YXQYBCABKAsyHC5nYW1lX21lc3NhZ2UuTG9zZVBsYXllclN0YXRIAFIOTG9zZVBsYXllclN0YXQSNAoITmV4dEdhbWUYBSABKAsyFi5nYW1lX21lc3NhZ2UuTmV4dEdhbWVIAFIITmV4dEdhbWUSOgoKRWxpbWluYXRlZBgGIAEoCzIYLmdhbWVfbWVzc2FnZS5FbGltaW5hdGVkSABSCkVsaW1pbmF0ZWRCBgoEc3RhdA==');
@$core.Deprecated('Use activeRummyPlayerStatDescriptor instead')
const ActiveRummyPlayerStat$json = const {
  '1': 'ActiveRummyPlayerStat',
  '2': const [
    const {'1': 'arpAction', '3': 1, '4': 1, '5': 14, '6': '.game_message.ARPAction', '10': 'arpAction'},
    const {'1': 'nextCard', '3': 2, '4': 1, '5': 5, '10': 'nextCard'},
    const {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `ActiveRummyPlayerStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeRummyPlayerStatDescriptor = $convert.base64Decode('ChVBY3RpdmVSdW1teVBsYXllclN0YXQSNQoJYXJwQWN0aW9uGAEgASgOMhcuZ2FtZV9tZXNzYWdlLkFSUEFjdGlvblIJYXJwQWN0aW9uEhoKCG5leHRDYXJkGAIgASgFUghuZXh0Q2FyZBIWCgZzdGF0dXMYAyABKAlSBnN0YXR1cw==');
@$core.Deprecated('Use inActiveRummyPlaterStatDescriptor instead')
const InActiveRummyPlaterStat$json = const {
  '1': 'InActiveRummyPlaterStat',
  '2': const [
    const {'1': 'activePlayerId', '3': 1, '4': 1, '5': 5, '10': 'activePlayerId'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `InActiveRummyPlaterStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inActiveRummyPlaterStatDescriptor = $convert.base64Decode('ChdJbkFjdGl2ZVJ1bW15UGxhdGVyU3RhdBImCg5hY3RpdmVQbGF5ZXJJZBgBIAEoBVIOYWN0aXZlUGxheWVySWQSFgoGc3RhdHVzGAIgASgJUgZzdGF0dXM=');
@$core.Deprecated('Use wonPlayerStatDescriptor instead')
const WonPlayerStat$json = const {
  '1': 'WonPlayerStat',
  '2': const [
    const {'1': 'round', '3': 1, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'afterWinCards', '3': 2, '4': 1, '5': 11, '6': '.AfterWinCards', '10': 'afterWinCards'},
    const {'1': 'points', '3': 3, '4': 3, '5': 11, '6': '.game_message.WonPlayerStat.PointsEntry', '10': 'points'},
  ],
  '3': const [WonPlayerStat_PointsEntry$json],
};

@$core.Deprecated('Use wonPlayerStatDescriptor instead')
const WonPlayerStat_PointsEntry$json = const {
  '1': 'PointsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `WonPlayerStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wonPlayerStatDescriptor = $convert.base64Decode('Cg1Xb25QbGF5ZXJTdGF0EhQKBXJvdW5kGAEgASgFUgVyb3VuZBI0Cg1hZnRlcldpbkNhcmRzGAIgASgLMg4uQWZ0ZXJXaW5DYXJkc1INYWZ0ZXJXaW5DYXJkcxI/CgZwb2ludHMYAyADKAsyJy5nYW1lX21lc3NhZ2UuV29uUGxheWVyU3RhdC5Qb2ludHNFbnRyeVIGcG9pbnRzGjkKC1BvaW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use losePlayerStatDescriptor instead')
const LosePlayerStat$json = const {
  '1': 'LosePlayerStat',
  '2': const [
    const {'1': 'round', '3': 1, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'wonPlayer', '3': 2, '4': 1, '5': 9, '10': 'wonPlayer'},
    const {'1': 'winningCards', '3': 3, '4': 3, '5': 5, '10': 'winningCards'},
    const {'1': 'afterWinCards', '3': 4, '4': 1, '5': 11, '6': '.AfterWinCards', '10': 'afterWinCards'},
    const {'1': 'points', '3': 5, '4': 3, '5': 11, '6': '.game_message.LosePlayerStat.PointsEntry', '10': 'points'},
  ],
  '3': const [LosePlayerStat_PointsEntry$json],
};

@$core.Deprecated('Use losePlayerStatDescriptor instead')
const LosePlayerStat_PointsEntry$json = const {
  '1': 'PointsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `LosePlayerStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List losePlayerStatDescriptor = $convert.base64Decode('Cg5Mb3NlUGxheWVyU3RhdBIUCgVyb3VuZBgBIAEoBVIFcm91bmQSHAoJd29uUGxheWVyGAIgASgJUgl3b25QbGF5ZXISIgoMd2lubmluZ0NhcmRzGAMgAygFUgx3aW5uaW5nQ2FyZHMSNAoNYWZ0ZXJXaW5DYXJkcxgEIAEoCzIOLkFmdGVyV2luQ2FyZHNSDWFmdGVyV2luQ2FyZHMSQAoGcG9pbnRzGAUgAygLMiguZ2FtZV9tZXNzYWdlLkxvc2VQbGF5ZXJTdGF0LlBvaW50c0VudHJ5UgZwb2ludHMaOQoLUG9pbnRzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAVSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use nextGameDescriptor instead')
const NextGame$json = const {
  '1': 'NextGame',
  '2': const [
    const {'1': 'cards', '3': 2, '4': 3, '5': 5, '10': 'cards'},
    const {'1': 'youStart', '3': 3, '4': 1, '5': 8, '10': 'youStart'},
    const {'1': 'activePlayerId', '3': 4, '4': 1, '5': 5, '10': 'activePlayerId'},
    const {'1': 'round', '3': 5, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'nextCard', '3': 9, '4': 1, '5': 5, '10': 'nextCard'},
  ],
};

/// Descriptor for `NextGame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nextGameDescriptor = $convert.base64Decode('CghOZXh0R2FtZRIUCgVjYXJkcxgCIAMoBVIFY2FyZHMSGgoIeW91U3RhcnQYAyABKAhSCHlvdVN0YXJ0EiYKDmFjdGl2ZVBsYXllcklkGAQgASgFUg5hY3RpdmVQbGF5ZXJJZBIUCgVyb3VuZBgFIAEoBVIFcm91bmQSGgoIbmV4dENhcmQYCSABKAVSCG5leHRDYXJk');
@$core.Deprecated('Use eliminatedDescriptor instead')
const Eliminated$json = const {
  '1': 'Eliminated',
  '2': const [
    const {'1': 'round', '3': 1, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'totalPoints', '3': 2, '4': 3, '5': 11, '6': '.game_message.Eliminated.TotalPointsEntry', '10': 'totalPoints'},
  ],
  '3': const [Eliminated_TotalPointsEntry$json],
};

@$core.Deprecated('Use eliminatedDescriptor instead')
const Eliminated_TotalPointsEntry$json = const {
  '1': 'TotalPointsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Eliminated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eliminatedDescriptor = $convert.base64Decode('CgpFbGltaW5hdGVkEhQKBXJvdW5kGAEgASgFUgVyb3VuZBJLCgt0b3RhbFBvaW50cxgCIAMoCzIpLmdhbWVfbWVzc2FnZS5FbGltaW5hdGVkLlRvdGFsUG9pbnRzRW50cnlSC3RvdGFsUG9pbnRzGj4KEFRvdGFsUG9pbnRzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAVSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use tournamentOverDescriptor instead')
const TournamentOver$json = const {
  '1': 'TournamentOver',
  '2': const [
    const {'1': 'sharedTrophy', '3': 1, '4': 1, '5': 8, '10': 'sharedTrophy'},
    const {'1': 'trophyWinners', '3': 2, '4': 3, '5': 9, '10': 'trophyWinners'},
    const {'1': 'youWon', '3': 3, '4': 1, '5': 8, '10': 'youWon'},
  ],
};

/// Descriptor for `TournamentOver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentOverDescriptor = $convert.base64Decode('Cg5Ub3VybmFtZW50T3ZlchIiCgxzaGFyZWRUcm9waHkYASABKAhSDHNoYXJlZFRyb3BoeRIkCg10cm9waHlXaW5uZXJzGAIgAygJUg10cm9waHlXaW5uZXJzEhYKBnlvdVdvbhgDIAEoCFIGeW91V29u');
