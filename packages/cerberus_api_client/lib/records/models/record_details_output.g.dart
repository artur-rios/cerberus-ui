// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDetailsOutput _$RecordDetailsOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'recordId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'profileIds',
      'folderId',
      'collectionIds',
    ],
    requiredKeys: const ['envelope'],
    disallowNullValues: const [
      'recordId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return RecordDetailsOutput(
    recordId: json['recordId'] as String?,
    revision: RecordDetailsOutput._read_revision(json['revision']),
    serverSequence: RecordDetailsOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: RecordDetailsOutput._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderId: json['folderId'] as String?,
    collectionIds: (json['collectionIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$RecordDetailsOutputToJson(
  RecordDetailsOutput instance,
) => <String, dynamic>{
  'recordId': ?instance.recordId,
  'revision': ?RecordDetailsOutput._write_revision(instance.revision),
  'serverSequence': ?RecordDetailsOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?RecordDetailsOutput._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'profileIds': ?instance.profileIds,
  'folderId': ?instance.folderId,
  'collectionIds': ?instance.collectionIds,
};
