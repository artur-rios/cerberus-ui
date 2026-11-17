// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileCommand _$UpdateProfileCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    disallowNullValues: const ['expectedRevision', 'envelope', 'editedAt'],
  );
  return UpdateProfileCommand(
    expectedRevision: UpdateProfileCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    editedAt: UpdateProfileCommand._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateProfileCommandToJson(
  UpdateProfileCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?UpdateProfileCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'envelope': ?instance.envelope?.toJson(),
  'editedAt': ?UpdateProfileCommand._write_editedAt(instance.editedAt),
};
