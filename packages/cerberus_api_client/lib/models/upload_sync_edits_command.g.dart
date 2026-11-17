// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_sync_edits_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadSyncEditsCommand _$UploadSyncEditsCommandFromJson(
  Map<String, dynamic> json,
) => UploadSyncEditsCommand(
  edits: (json['edits'] as List<dynamic>)
      .map(
        (e) => UploadSyncEditsCommandEditsSealed.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$UploadSyncEditsCommandToJson(
  UploadSyncEditsCommand instance,
) => <String, dynamic>{'edits': instance.edits};
