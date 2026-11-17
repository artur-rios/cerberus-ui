// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permanently_delete_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermanentlyDeleteRecordCommand _$PermanentlyDeleteRecordCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return PermanentlyDeleteRecordCommand(
    expectedRevision: PermanentlyDeleteRecordCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$PermanentlyDeleteRecordCommandToJson(
  PermanentlyDeleteRecordCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?PermanentlyDeleteRecordCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
