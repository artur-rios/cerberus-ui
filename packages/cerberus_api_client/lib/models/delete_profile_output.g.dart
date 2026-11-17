// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProfileOutput _$DeleteProfileOutputFromJson(Map<String, dynamic> json) =>
    DeleteProfileOutput(
      profileId: json['profileId'] as String?,
      trashOperationId: json['trashOperationId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      purgeAt: json['purgeAt'] == null
          ? null
          : DateTime.parse(json['purgeAt'] as String),
    );

Map<String, dynamic> _$DeleteProfileOutputToJson(
  DeleteProfileOutput instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'trashOperationId': instance.trashOperationId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
};
