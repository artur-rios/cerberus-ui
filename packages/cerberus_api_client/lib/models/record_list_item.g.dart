// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordListItem _$RecordListItemFromJson(Map<String, dynamic> json) =>
    RecordListItem(
      recordId: json['recordId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      envelope: json['envelope'] == null
          ? null
          : EncryptedEnvelope.fromJson(
              json['envelope'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RecordListItemToJson(RecordListItem instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
      'envelope': instance.envelope,
    };
