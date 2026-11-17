// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordCommand _$UpdateRecordCommandFromJson(Map<String, dynamic> json) =>
    UpdateRecordCommand(
      expectedRevision: (json['expectedRevision'] as num).toInt(),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      editedAt: DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$UpdateRecordCommandToJson(
  UpdateRecordCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
};
