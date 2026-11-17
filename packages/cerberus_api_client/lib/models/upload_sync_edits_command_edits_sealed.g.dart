// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_sync_edits_command_edits_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedToJson(
  UploadSyncEditsCommandEditsSealed instance,
) => <String, dynamic>{};

UploadSyncEditsCommandEditsSealedSyncRecordCreate
_$UploadSyncEditsCommandEditsSealedSyncRecordCreateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncRecordCreate(
  input: RecordCreateInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncRecordCreateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncRecordCreateToJson(
  UploadSyncEditsCommandEditsSealedSyncRecordCreate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncRecordCreateEditTypeEnumMap[instance.editType]!,
};

const _$SyncRecordCreateEditTypeEnumMap = {
  SyncRecordCreateEditType.recordCreate: 'record-create',
  SyncRecordCreateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncRecordUpdate
_$UploadSyncEditsCommandEditsSealedSyncRecordUpdateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncRecordUpdate(
  input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncRecordUpdateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncRecordUpdateToJson(
  UploadSyncEditsCommandEditsSealedSyncRecordUpdate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncRecordUpdateEditTypeEnumMap[instance.editType]!,
};

const _$SyncRecordUpdateEditTypeEnumMap = {
  SyncRecordUpdateEditType.recordUpdate: 'record-update',
  SyncRecordUpdateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncFolderCreate
_$UploadSyncEditsCommandEditsSealedSyncFolderCreateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncFolderCreate(
  input: FolderCreateInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncFolderCreateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncFolderCreateToJson(
  UploadSyncEditsCommandEditsSealedSyncFolderCreate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncFolderCreateEditTypeEnumMap[instance.editType]!,
};

const _$SyncFolderCreateEditTypeEnumMap = {
  SyncFolderCreateEditType.folderCreate: 'folder-create',
  SyncFolderCreateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncFolderUpdate
_$UploadSyncEditsCommandEditsSealedSyncFolderUpdateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncFolderUpdate(
  input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncFolderUpdateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncFolderUpdateToJson(
  UploadSyncEditsCommandEditsSealedSyncFolderUpdate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncFolderUpdateEditTypeEnumMap[instance.editType]!,
};

const _$SyncFolderUpdateEditTypeEnumMap = {
  SyncFolderUpdateEditType.folderUpdate: 'folder-update',
  SyncFolderUpdateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncCollectionCreate
_$UploadSyncEditsCommandEditsSealedSyncCollectionCreateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncCollectionCreate(
  input: CollectionCreateInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncCollectionCreateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic>
_$UploadSyncEditsCommandEditsSealedSyncCollectionCreateToJson(
  UploadSyncEditsCommandEditsSealedSyncCollectionCreate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncCollectionCreateEditTypeEnumMap[instance.editType]!,
};

const _$SyncCollectionCreateEditTypeEnumMap = {
  SyncCollectionCreateEditType.collectionCreate: 'collection-create',
  SyncCollectionCreateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncCollectionUpdate
_$UploadSyncEditsCommandEditsSealedSyncCollectionUpdateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncCollectionUpdate(
  input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncCollectionUpdateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic>
_$UploadSyncEditsCommandEditsSealedSyncCollectionUpdateToJson(
  UploadSyncEditsCommandEditsSealedSyncCollectionUpdate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncCollectionUpdateEditTypeEnumMap[instance.editType]!,
};

const _$SyncCollectionUpdateEditTypeEnumMap = {
  SyncCollectionUpdateEditType.collectionUpdate: 'collection-update',
  SyncCollectionUpdateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncProfileCreate
_$UploadSyncEditsCommandEditsSealedSyncProfileCreateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncProfileCreate(
  input: ProfileCreateInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncProfileCreateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncProfileCreateToJson(
  UploadSyncEditsCommandEditsSealedSyncProfileCreate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncProfileCreateEditTypeEnumMap[instance.editType]!,
};

const _$SyncProfileCreateEditTypeEnumMap = {
  SyncProfileCreateEditType.profileCreate: 'profile-create',
  SyncProfileCreateEditType.$unknown: r'$unknown',
};

UploadSyncEditsCommandEditsSealedSyncProfileUpdate
_$UploadSyncEditsCommandEditsSealedSyncProfileUpdateFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommandEditsSealedSyncProfileUpdate(
  input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
  operationId: json['operationId'] as String,
  editType: SyncProfileUpdateEditType.fromJson(json['editType'] as String),
);

Map<String, dynamic> _$UploadSyncEditsCommandEditsSealedSyncProfileUpdateToJson(
  UploadSyncEditsCommandEditsSealedSyncProfileUpdate instance,
) => <String, dynamic>{
  'input': instance.input,
  'operationId': instance.operationId,
  'editType': _$SyncProfileUpdateEditTypeEnumMap[instance.editType]!,
};

const _$SyncProfileUpdateEditTypeEnumMap = {
  SyncProfileUpdateEditType.profileUpdate: 'profile-update',
  SyncProfileUpdateEditType.$unknown: r'$unknown',
};
