// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_sync_edits_command_edits_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncCollectionCreate _$SyncCollectionCreateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncCollectionCreate(
    input: CollectionCreateInput.fromJson(
      json['input'] as Map<String, dynamic>,
    ),
    operationId: json['operationId'] as String,
    editType: SyncCollectionCreate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncCollectionCreateToJson(
  SyncCollectionCreate instance,
) => <String, dynamic>{
  'input': instance.input.toJson(),
  'operationId': instance.operationId,
  'editType': ?SyncCollectionCreate._write_editType(instance.editType),
};

SyncCollectionUpdate _$SyncCollectionUpdateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncCollectionUpdate(
    input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncCollectionUpdate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncCollectionUpdateToJson(
  SyncCollectionUpdate instance,
) => <String, dynamic>{
  'input': instance.input.toJson(),
  'operationId': instance.operationId,
  'editType': ?SyncCollectionUpdate._write_editType(instance.editType),
};

SyncFolderCreate _$SyncFolderCreateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncFolderCreate(
    input: FolderCreateInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncFolderCreate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncFolderCreateToJson(SyncFolderCreate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncFolderCreate._write_editType(instance.editType),
    };

SyncFolderUpdate _$SyncFolderUpdateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncFolderUpdate(
    input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncFolderUpdate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncFolderUpdateToJson(SyncFolderUpdate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncFolderUpdate._write_editType(instance.editType),
    };

SyncProfileCreate _$SyncProfileCreateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncProfileCreate(
    input: ProfileCreateInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncProfileCreate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncProfileCreateToJson(SyncProfileCreate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncProfileCreate._write_editType(instance.editType),
    };

SyncProfileUpdate _$SyncProfileUpdateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncProfileUpdate(
    input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncProfileUpdate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncProfileUpdateToJson(SyncProfileUpdate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncProfileUpdate._write_editType(instance.editType),
    };

SyncRecordCreate _$SyncRecordCreateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncRecordCreate(
    input: RecordCreateInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncRecordCreate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncRecordCreateToJson(SyncRecordCreate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncRecordCreate._write_editType(instance.editType),
    };

SyncRecordUpdate _$SyncRecordUpdateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['input', 'operationId', 'editType'],
    requiredKeys: const ['input', 'operationId', 'editType'],
    disallowNullValues: const ['input', 'operationId', 'editType'],
  );
  return SyncRecordUpdate(
    input: SyncContentEditInput.fromJson(json['input'] as Map<String, dynamic>),
    operationId: json['operationId'] as String,
    editType: SyncRecordUpdate._read_editType(json['editType']),
  );
}

Map<String, dynamic> _$SyncRecordUpdateToJson(SyncRecordUpdate instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'operationId': instance.operationId,
      'editType': ?SyncRecordUpdate._write_editType(instance.editType),
    };
