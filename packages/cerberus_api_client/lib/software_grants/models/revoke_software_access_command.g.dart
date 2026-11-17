// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_software_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeSoftwareAccessCommand _$RevokeSoftwareAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return RevokeSoftwareAccessCommand(
    expectedRevision: RevokeSoftwareAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$RevokeSoftwareAccessCommandToJson(
  RevokeSoftwareAccessCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?RevokeSoftwareAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
