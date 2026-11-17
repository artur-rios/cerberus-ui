// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordListItem _$RecordListItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'recordId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
    disallowNullValues: const [
      'recordId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return RecordListItem(
    recordId: json['recordId'] as String?,
    revision: RecordListItem._read_revision(json['revision']),
    serverSequence: RecordListItem._read_serverSequence(json['serverSequence']),
    editedAt: RecordListItem._read_editedAt(json['editedAt']),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecordListItemToJson(RecordListItem instance) =>
    <String, dynamic>{
      'recordId': ?instance.recordId,
      'revision': ?RecordListItem._write_revision(instance.revision),
      'serverSequence': ?RecordListItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?RecordListItem._write_editedAt(instance.editedAt),
      'envelope': ?instance.envelope?.toJson(),
    };
