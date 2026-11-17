// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_record_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashRecordItem _$TrashRecordItemFromJson(Map<String, dynamic> json) =>
    TrashRecordItem(
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
      kind: TrashRecordItemKind.fromJson(json['kind'] as String),
    );

Map<String, dynamic> _$TrashRecordItemToJson(TrashRecordItem instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt.toIso8601String(),
      'deletedAt': instance.deletedAt.toIso8601String(),
      'purgeAt': instance.purgeAt.toIso8601String(),
      'envelope': instance.envelope,
      'kind': _$TrashRecordItemKindEnumMap[instance.kind]!,
    };

const _$TrashRecordItemKindEnumMap = {
  TrashRecordItemKind.record: 'record',
  TrashRecordItemKind.$unknown: r'$unknown',
};
