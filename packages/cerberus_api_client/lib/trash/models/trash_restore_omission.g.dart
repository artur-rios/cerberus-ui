// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_restore_omission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashRestoreOmission _$TrashRestoreOmissionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceKind',
      'resourceId',
      'associationKind',
      'count',
    ],
    requiredKeys: const [
      'resourceKind',
      'resourceId',
      'associationKind',
      'count',
    ],
    disallowNullValues: const ['resourceId', 'count'],
  );
  return TrashRestoreOmission(
    resourceKind: json['resourceKind'] as String?,
    resourceId: json['resourceId'] as String,
    associationKind: json['associationKind'] as String?,
    count: TrashRestoreOmission._read_count(json['count']),
  );
}

Map<String, dynamic> _$TrashRestoreOmissionToJson(
  TrashRestoreOmission instance,
) => <String, dynamic>{
  'resourceKind': instance.resourceKind,
  'resourceId': instance.resourceId,
  'associationKind': instance.associationKind,
  'count': ?TrashRestoreOmission._write_count(instance.count),
};
