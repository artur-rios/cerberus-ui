// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashListItem _$TrashListItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'kind',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
    ],
    requiredKeys: const ['kind'],
    disallowNullValues: const [
      'kind',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
    ],
  );
  return TrashListItem(
    kind: json['kind'] as String,
    operationId: json['operationId'] as String?,
    resourceId: json['resourceId'] as String?,
    revision: TrashListItem._read_revision(json['revision']),
    serverSequence: TrashListItem._read_serverSequence(json['serverSequence']),
    editedAt: TrashListItem._read_editedAt(json['editedAt']),
    deletedAt: TrashListItem._read_deletedAt(json['deletedAt']),
    purgeAt: TrashListItem._read_purgeAt(json['purgeAt']),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrashListItemToJson(TrashListItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'operationId': ?instance.operationId,
      'resourceId': ?instance.resourceId,
      'revision': ?TrashListItem._write_revision(instance.revision),
      'serverSequence': ?TrashListItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?TrashListItem._write_editedAt(instance.editedAt),
      'deletedAt': ?TrashListItem._write_deletedAt(instance.deletedAt),
      'purgeAt': ?TrashListItem._write_purgeAt(instance.purgeAt),
      'envelope': ?instance.envelope?.toJson(),
    };
