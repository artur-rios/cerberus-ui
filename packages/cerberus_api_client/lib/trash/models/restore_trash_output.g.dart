// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_trash_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreTrashOutput _$RestoreTrashOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'rootKind',
      'rootResourceId',
      'restoredAt',
      'items',
      'omissions',
    ],
    requiredKeys: const [
      'operationId',
      'rootKind',
      'rootResourceId',
      'restoredAt',
      'items',
      'omissions',
    ],
    disallowNullValues: const ['operationId', 'rootResourceId', 'restoredAt'],
  );
  return RestoreTrashOutput(
    operationId: json['operationId'] as String,
    rootKind: json['rootKind'] as String?,
    rootResourceId: json['rootResourceId'] as String,
    restoredAt: RestoreTrashOutput._read_restoredAt(json['restoredAt']),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => TrashRestoredItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    omissions: (json['omissions'] as List<dynamic>?)
        ?.map((e) => TrashRestoreOmission.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RestoreTrashOutputToJson(RestoreTrashOutput instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'rootKind': instance.rootKind,
      'rootResourceId': instance.rootResourceId,
      'restoredAt': ?RestoreTrashOutput._write_restoredAt(instance.restoredAt),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'omissions': instance.omissions?.map((e) => e.toJson()).toList(),
    };
