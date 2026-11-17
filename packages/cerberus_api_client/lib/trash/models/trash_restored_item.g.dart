// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_restored_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashRestoredItem _$TrashRestoredItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'kind',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
    requiredKeys: const [
      'kind',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
    disallowNullValues: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return TrashRestoredItem(
    kind: json['kind'] as String?,
    resourceId: json['resourceId'] as String,
    revision: TrashRestoredItem._read_revision(json['revision']),
    serverSequence: TrashRestoredItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: TrashRestoredItem._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$TrashRestoredItemToJson(TrashRestoredItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'resourceId': instance.resourceId,
      'revision': ?TrashRestoredItem._write_revision(instance.revision),
      'serverSequence': ?TrashRestoredItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?TrashRestoredItem._write_editedAt(instance.editedAt),
    };
