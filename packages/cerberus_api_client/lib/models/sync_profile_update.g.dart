// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_profile_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncProfileUpdate _$SyncProfileUpdateFromJson(Map<String, dynamic> json) =>
    SyncProfileUpdate(
      input: SyncContentEditInput.fromJson(
        json['input'] as Map<String, dynamic>,
      ),
      operationId: json['operationId'] as String,
      editType: SyncProfileUpdateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncProfileUpdateToJson(SyncProfileUpdate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncProfileUpdateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncProfileUpdateEditTypeEnumMap = {
  SyncProfileUpdateEditType.profileUpdate: 'profile-update',
  SyncProfileUpdateEditType.$unknown: r'$unknown',
};
