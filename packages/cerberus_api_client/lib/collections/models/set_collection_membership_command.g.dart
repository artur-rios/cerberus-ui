// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_collection_membership_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetCollectionMembershipCommand _$SetCollectionMembershipCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'expectedRevision',
      'envelope',
      'editedAt',
      'recordIds',
      'folderIds',
    ],
    requiredKeys: const [
      'expectedRevision',
      'envelope',
      'editedAt',
      'recordIds',
      'folderIds',
    ],
    disallowNullValues: const ['expectedRevision', 'envelope', 'editedAt'],
  );
  return SetCollectionMembershipCommand(
    expectedRevision: SetCollectionMembershipCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: SetCollectionMembershipCommand._read_editedAt(json['editedAt']),
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$SetCollectionMembershipCommandToJson(
  SetCollectionMembershipCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?SetCollectionMembershipCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'envelope': instance.envelope.toJson(),
  'editedAt': ?SetCollectionMembershipCommand._write_editedAt(
    instance.editedAt,
  ),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
