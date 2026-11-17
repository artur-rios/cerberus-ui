// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permanently_delete_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermanentlyDeleteRecordOutput _$PermanentlyDeleteRecordOutputFromJson(
  Map<String, dynamic> json,
) => PermanentlyDeleteRecordOutput(
  recordId: json['recordId'] as String?,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$PermanentlyDeleteRecordOutputToJson(
  PermanentlyDeleteRecordOutput instance,
) => <String, dynamic>{
  'recordId': instance.recordId,
  'deletedAt': instance.deletedAt?.toIso8601String(),
};
