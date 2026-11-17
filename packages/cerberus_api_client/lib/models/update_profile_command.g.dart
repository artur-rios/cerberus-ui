// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileCommand _$UpdateProfileCommandFromJson(
  Map<String, dynamic> json,
) => UpdateProfileCommand(
  expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
  envelope: json['envelope'] == null
      ? null
      : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
);

Map<String, dynamic> _$UpdateProfileCommandToJson(
  UpdateProfileCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt?.toIso8601String(),
};
