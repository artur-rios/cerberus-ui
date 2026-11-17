// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProfileCommand _$DeleteProfileCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return DeleteProfileCommand(
    expectedRevision: DeleteProfileCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$DeleteProfileCommandToJson(
  DeleteProfileCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?DeleteProfileCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
