// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_trash_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreTrashCommand _$RestoreTrashCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return RestoreTrashCommand(
    expectedRevision: RestoreTrashCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$RestoreTrashCommandToJson(
  RestoreTrashCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?RestoreTrashCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
