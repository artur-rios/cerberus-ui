// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_record_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncRecordUpdate _$SyncRecordUpdateFromJson(Map<String, dynamic> json) =>
    SyncRecordUpdate(
      input: SyncContentEditInput.fromJson(
        json['input'] as Map<String, dynamic>,
      ),
      operationId: json['operationId'] as String,
      editType: SyncRecordUpdateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncRecordUpdateToJson(SyncRecordUpdate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncRecordUpdateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncRecordUpdateEditTypeEnumMap = {
  SyncRecordUpdateEditType.recordUpdate: 'record-update',
  SyncRecordUpdateEditType.$unknown: r'$unknown',
};
