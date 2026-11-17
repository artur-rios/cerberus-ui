// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveRecordOutput _$MoveRecordOutputFromJson(Map<String, dynamic> json) =>
    MoveRecordOutput(
      recordId: json['recordId'] as String?,
      folderId: json['folderId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoveRecordOutputToJson(MoveRecordOutput instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'folderId': instance.folderId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
    };
