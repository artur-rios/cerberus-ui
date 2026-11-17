// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_profile_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenProfileAccessCommand _$OpenProfileAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return OpenProfileAccessCommand(
    expectedRevision: OpenProfileAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$OpenProfileAccessCommandToJson(
  OpenProfileAccessCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?OpenProfileAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
