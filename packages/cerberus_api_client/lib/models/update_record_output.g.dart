// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordOutput _$UpdateRecordOutputFromJson(Map<String, dynamic> json) =>
    UpdateRecordOutput(
      recordId: json['recordId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$UpdateRecordOutputToJson(UpdateRecordOutput instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
    };
