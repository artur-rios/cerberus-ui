// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListItem _$CollectionListItemFromJson(Map<String, dynamic> json) =>
    CollectionListItem(
      collectionId: json['collectionId'] as String?,
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

Map<String, dynamic> _$CollectionListItemToJson(CollectionListItem instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
      'envelope': instance.envelope,
    };
