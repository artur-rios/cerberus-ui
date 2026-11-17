// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_collection_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncCollectionUpdate _$SyncCollectionUpdateFromJson(
  Map<String, dynamic> json,
) => SyncCollectionUpdate(
  input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncCollectionUpdateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$SyncCollectionUpdateToJson(
  SyncCollectionUpdate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncCollectionUpdateEditTypeEnumMap[instance.editType]!,
};

const _$SyncCollectionUpdateEditTypeEnumMap = {
  SyncCollectionUpdateEditType.collectionUpdate: 'collection-update',
  SyncCollectionUpdateEditType.$unknown: r'$unknown',
};
