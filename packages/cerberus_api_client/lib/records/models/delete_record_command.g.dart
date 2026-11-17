// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordCommand _$DeleteRecordCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return DeleteRecordCommand(
    expectedRevision: DeleteRecordCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$DeleteRecordCommandToJson(
  DeleteRecordCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?DeleteRecordCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
