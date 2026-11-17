// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_restore_omission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashRestoreOmission _$TrashRestoreOmissionFromJson(
  Map<String, dynamic> json,
) => TrashRestoreOmission(
  resourceKind: json['resourceKind'] as String?,
  resourceId: json['resourceId'] as String,
  associationKind: json['associationKind'] as String?,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$TrashRestoreOmissionToJson(
  TrashRestoreOmission instance,
) => <String, dynamic>{
  'resourceKind': instance.resourceKind,
  'resourceId': instance.resourceId,
  'associationKind': instance.associationKind,
  'count': instance.count,
};
