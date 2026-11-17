// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFolderCommand _$UpdateFolderCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    requiredKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    disallowNullValues: const ['expectedRevision', 'envelope', 'editedAt'],
  );
  return UpdateFolderCommand(
    expectedRevision: UpdateFolderCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: UpdateFolderCommand._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateFolderCommandToJson(
  UpdateFolderCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?UpdateFolderCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'envelope': instance.envelope.toJson(),
  'editedAt': ?UpdateFolderCommand._write_editedAt(instance.editedAt),
};
