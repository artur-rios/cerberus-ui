// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_collection_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncCollectionCreate _$SyncCollectionCreateFromJson(
  Map<String, dynamic> json,
) => SyncCollectionCreate(
  input: CollectionCreateInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncCollectionCreateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$SyncCollectionCreateToJson(
  SyncCollectionCreate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncCollectionCreateEditTypeEnumMap[instance.editType]!,
};

const _$SyncCollectionCreateEditTypeEnumMap = {
  SyncCollectionCreateEditType.collectionCreate: 'collection-create',
  SyncCollectionCreateEditType.$unknown: r'$unknown',
};
