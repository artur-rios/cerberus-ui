// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_content_edit_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncContentEditInput _$SyncContentEditInputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['resourceId', 'envelope', 'editedAt'],
    requiredKeys: const ['resourceId', 'envelope', 'editedAt'],
    disallowNullValues: const ['resourceId', 'envelope', 'editedAt'],
  );
  return SyncContentEditInput(
    resourceId: json['resourceId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: SyncContentEditInput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$SyncContentEditInputToJson(
  SyncContentEditInput instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'envelope': instance.envelope.toJson(),
  'editedAt': ?SyncContentEditInput._write_editedAt(instance.editedAt),
};
