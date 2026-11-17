// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileOutput _$UpdateProfileOutputFromJson(Map<String, dynamic> json) =>
    UpdateProfileOutput(
      profileId: json['profileId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$UpdateProfileOutputToJson(
  UpdateProfileOutput instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
};
