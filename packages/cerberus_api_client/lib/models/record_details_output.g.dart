// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDetailsOutput _$RecordDetailsOutputFromJson(Map<String, dynamic> json) =>
    RecordDetailsOutput(
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      recordId: json['recordId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      profileIds: (json['profileIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      folderId: json['folderId'] as String?,
      collectionIds: (json['collectionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecordDetailsOutputToJson(
  RecordDetailsOutput instance,
) => <String, dynamic>{
  'recordId': instance.recordId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
  'envelope': instance.envelope,
  'profileIds': instance.profileIds,
  'folderId': instance.folderId,
  'collectionIds': instance.collectionIds,
};
