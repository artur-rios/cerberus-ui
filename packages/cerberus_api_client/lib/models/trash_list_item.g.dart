// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashListItem _$TrashListItemFromJson(Map<String, dynamic> json) =>
    TrashListItem(
      kind: json['kind'] as String,
      operationId: json['operationId'] as String?,
      resourceId: json['resourceId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      purgeAt: json['purgeAt'] == null
          ? null
          : DateTime.parse(json['purgeAt'] as String),
      envelope: json['envelope'] == null
          ? null
          : EncryptedEnvelope.fromJson(
              json['envelope'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TrashListItemToJson(TrashListItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'purgeAt': instance.purgeAt?.toIso8601String(),
      'envelope': instance.envelope,
    };
