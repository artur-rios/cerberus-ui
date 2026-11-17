// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileOutput _$CreateProfileOutputFromJson(Map<String, dynamic> json) =>
    CreateProfileOutput(
      profileId: json['profileId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$CreateProfileOutputToJson(
  CreateProfileOutput instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
};
