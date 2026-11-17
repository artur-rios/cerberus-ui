// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_trash_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyTrashCommand _$EmptyTrashCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return EmptyTrashCommand(
    expectedRevision: EmptyTrashCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$EmptyTrashCommandToJson(EmptyTrashCommand instance) =>
    <String, dynamic>{
      'expectedRevision': ?EmptyTrashCommand._write_expectedRevision(
        instance.expectedRevision,
      ),
    };
