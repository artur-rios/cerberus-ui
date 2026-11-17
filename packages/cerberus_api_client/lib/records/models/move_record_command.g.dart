// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveRecordCommand _$MoveRecordCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'folderId'],
    requiredKeys: const ['expectedRevision', 'folderId'],
    disallowNullValues: const ['expectedRevision'],
  );
  return MoveRecordCommand(
    expectedRevision: MoveRecordCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    folderId: json['folderId'] as String?,
  );
}

Map<String, dynamic> _$MoveRecordCommandToJson(MoveRecordCommand instance) =>
    <String, dynamic>{
      'expectedRevision': ?MoveRecordCommand._write_expectedRevision(
        instance.expectedRevision,
      ),
      'folderId': instance.folderId,
    };
