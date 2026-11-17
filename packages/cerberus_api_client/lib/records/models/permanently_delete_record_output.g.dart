// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permanently_delete_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermanentlyDeleteRecordOutput _$PermanentlyDeleteRecordOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['recordId', 'deletedAt'],
    disallowNullValues: const ['recordId', 'deletedAt'],
  );
  return PermanentlyDeleteRecordOutput(
    recordId: json['recordId'] as String?,
    deletedAt: PermanentlyDeleteRecordOutput._read_deletedAt(json['deletedAt']),
  );
}

Map<String, dynamic> _$PermanentlyDeleteRecordOutputToJson(
  PermanentlyDeleteRecordOutput instance,
) => <String, dynamic>{
  'recordId': ?instance.recordId,
  'deletedAt': ?PermanentlyDeleteRecordOutput._write_deletedAt(
    instance.deletedAt,
  ),
};
