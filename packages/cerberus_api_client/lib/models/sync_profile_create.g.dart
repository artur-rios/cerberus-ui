// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_profile_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncProfileCreate _$SyncProfileCreateFromJson(Map<String, dynamic> json) =>
    SyncProfileCreate(
      input: ProfileCreateInput.fromJson(json['input'] as Map<String, dynamic>),
      operationId: json['operationId'] as String,
      editType: SyncProfileCreateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncProfileCreateToJson(SyncProfileCreate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncProfileCreateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncProfileCreateEditTypeEnumMap = {
  SyncProfileCreateEditType.profileCreate: 'profile-create',
  SyncProfileCreateEditType.$unknown: r'$unknown',
};
