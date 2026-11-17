// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordOutput _$DeleteRecordOutputFromJson(Map<String, dynamic> json) =>
    DeleteRecordOutput(
      recordId: json['recordId'] as String?,
      trashOperationId: json['trashOperationId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      purgeAt: json['purgeAt'] == null
          ? null
          : DateTime.parse(json['purgeAt'] as String),
    );

Map<String, dynamic> _$DeleteRecordOutputToJson(DeleteRecordOutput instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'trashOperationId': instance.trashOperationId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'purgeAt': instance.purgeAt?.toIso8601String(),
    };
