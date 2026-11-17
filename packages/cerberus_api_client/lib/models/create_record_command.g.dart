// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordCommand _$CreateRecordCommandFromJson(Map<String, dynamic> json) =>
    CreateRecordCommand(
      recordId: json['recordId'] as String,
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      editedAt: DateTime.parse(json['editedAt'] as String),
      profileIds: (json['profileIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      folderId: json['folderId'] as String?,
    );

Map<String, dynamic> _$CreateRecordCommandToJson(
  CreateRecordCommand instance,
) => <String, dynamic>{
  'recordId': instance.recordId,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
  'profileIds': instance.profileIds,
  'folderId': instance.folderId,
};
