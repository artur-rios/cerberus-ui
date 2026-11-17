// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordOutput _$CreateRecordOutputFromJson(Map<String, dynamic> json) =>
    CreateRecordOutput(
      recordId: json['recordId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$CreateRecordOutputToJson(CreateRecordOutput instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
    };
