// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_content_edit_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncContentEditInput _$SyncContentEditInputFromJson(
  Map<String, dynamic> json,
) => SyncContentEditInput(
  resourceId: json['resourceId'] as String,
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  editedAt: DateTime.parse(json['editedAt'] as String),
);

Map<String, dynamic> _$SyncContentEditInputToJson(
  SyncContentEditInput instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
};
