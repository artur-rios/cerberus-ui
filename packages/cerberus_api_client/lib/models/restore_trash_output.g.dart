// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_trash_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreTrashOutput _$RestoreTrashOutputFromJson(Map<String, dynamic> json) =>
    RestoreTrashOutput(
      operationId: json['operationId'] as String,
      rootKind: json['rootKind'] as String?,
      rootResourceId: json['rootResourceId'] as String,
      restoredAt: DateTime.parse(json['restoredAt'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => TrashRestoredItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      omissions: (json['omissions'] as List<dynamic>?)
          ?.map((e) => TrashRestoreOmission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestoreTrashOutputToJson(RestoreTrashOutput instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'rootKind': instance.rootKind,
      'rootResourceId': instance.rootResourceId,
      'restoredAt': instance.restoredAt.toIso8601String(),
      'items': instance.items,
      'omissions': instance.omissions,
    };
