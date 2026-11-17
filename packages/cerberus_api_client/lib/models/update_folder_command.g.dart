// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFolderCommand _$UpdateFolderCommandFromJson(Map<String, dynamic> json) =>
    UpdateFolderCommand(
      expectedRevision: (json['expectedRevision'] as num).toInt(),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      editedAt: DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$UpdateFolderCommandToJson(
  UpdateFolderCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
};
