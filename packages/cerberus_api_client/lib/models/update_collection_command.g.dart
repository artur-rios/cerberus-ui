// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionCommand _$UpdateCollectionCommandFromJson(
  Map<String, dynamic> json,
) => UpdateCollectionCommand(
  expectedRevision: (json['expectedRevision'] as num).toInt(),
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  editedAt: DateTime.parse(json['editedAt'] as String),
);

Map<String, dynamic> _$UpdateCollectionCommandToJson(
  UpdateCollectionCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
};
