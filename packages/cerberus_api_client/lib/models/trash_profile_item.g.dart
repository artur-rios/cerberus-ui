// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_profile_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashProfileItem _$TrashProfileItemFromJson(Map<String, dynamic> json) =>
    TrashProfileItem(
      keyWrappers: ProfileKeyWrappers.fromJson(
        json['keyWrappers'] as Map<String, dynamic>,
      ),
      operationId: json['operationId'] as String,
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      deletedAt: DateTime.parse(json['deletedAt'] as String),
      purgeAt: DateTime.parse(json['purgeAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      kind: TrashProfileItemKind.fromJson(json['kind'] as String),
    );

Map<String, dynamic> _$TrashProfileItemToJson(TrashProfileItem instance) =>
    <String, dynamic>{
      'keyWrappers': instance.keyWrappers,
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt.toIso8601String(),
      'deletedAt': instance.deletedAt.toIso8601String(),
      'purgeAt': instance.purgeAt.toIso8601String(),
      'envelope': instance.envelope,
      'kind': _$TrashProfileItemKindEnumMap[instance.kind]!,
    };

const _$TrashProfileItemKindEnumMap = {
  TrashProfileItemKind.profile: 'profile',
  TrashProfileItemKind.$unknown: r'$unknown',
};
