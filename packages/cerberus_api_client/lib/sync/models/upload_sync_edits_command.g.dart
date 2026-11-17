// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_sync_edits_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadSyncEditsCommand _$UploadSyncEditsCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['edits'],
    requiredKeys: const ['edits'],
    disallowNullValues: const ['edits'],
  );
  return UploadSyncEditsCommand(
    edits: UploadSyncEditsCommand._read_edits(json['edits']),
  );
}

Map<String, dynamic> _$UploadSyncEditsCommandToJson(
  UploadSyncEditsCommand instance,
) => <String, dynamic>{
  'edits': ?UploadSyncEditsCommand._write_edits(instance.edits),
};
