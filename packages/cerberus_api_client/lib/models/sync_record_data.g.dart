// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_record_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncRecordData _$SyncRecordDataFromJson(Map<String, dynamic> json) =>
    SyncRecordData(
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncRecordDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncRecordDataToJson(
  SyncRecordData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncRecordDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncRecordDataResourceTypeEnumMap = {
  SyncRecordDataResourceType.record: 'record',
  SyncRecordDataResourceType.$unknown: r'$unknown',
};
