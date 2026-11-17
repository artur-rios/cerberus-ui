// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordCommand _$CreateRecordCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'recordId',
      'envelope',
      'editedAt',
      'profileIds',
      'folderId',
    ],
    requiredKeys: const ['recordId', 'envelope', 'editedAt', 'profileIds'],
    disallowNullValues: const ['recordId', 'envelope', 'editedAt'],
  );
  return CreateRecordCommand(
    recordId: json['recordId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: CreateRecordCommand._read_editedAt(json['editedAt']),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderId: json['folderId'] as String?,
  );
}

Map<String, dynamic> _$CreateRecordCommandToJson(
  CreateRecordCommand instance,
) => <String, dynamic>{
  'recordId': instance.recordId,
  'envelope': instance.envelope.toJson(),
  'editedAt': ?CreateRecordCommand._write_editedAt(instance.editedAt),
  'profileIds': instance.profileIds,
  'folderId': ?instance.folderId,
};
