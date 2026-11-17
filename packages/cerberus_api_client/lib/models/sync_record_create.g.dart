// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_record_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncRecordCreate _$SyncRecordCreateFromJson(Map<String, dynamic> json) =>
    SyncRecordCreate(
      input: RecordCreateInput.fromJson(json['input'] as Map<String, dynamic>),
      operationId: json['operationId'] as String,
      editType: SyncRecordCreateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncRecordCreateToJson(SyncRecordCreate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncRecordCreateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncRecordCreateEditTypeEnumMap = {
  SyncRecordCreateEditType.recordCreate: 'record-create',
  SyncRecordCreateEditType.$unknown: r'$unknown',
};
