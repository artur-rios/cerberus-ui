// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edit_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditInput _$SyncEditInputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['editType', 'operationId'],
    requiredKeys: const ['editType', 'operationId'],
    disallowNullValues: const ['editType', 'operationId'],
  );
  return SyncEditInput(
    editType: json['editType'] as String,
    operationId: json['operationId'] as String,
  );
}

Map<String, dynamic> _$SyncEditInputToJson(SyncEditInput instance) =>
    <String, dynamic>{
      'editType': instance.editType,
      'operationId': instance.operationId,
    };
