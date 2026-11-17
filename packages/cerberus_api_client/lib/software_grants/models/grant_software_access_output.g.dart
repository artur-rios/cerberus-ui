// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_software_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantSoftwareAccessOutput _$GrantSoftwareAccessOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['grantId', 'revision'],
    disallowNullValues: const ['grantId', 'revision'],
  );
  return GrantSoftwareAccessOutput(
    grantId: json['grantId'] as String?,
    revision: GrantSoftwareAccessOutput._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$GrantSoftwareAccessOutputToJson(
  GrantSoftwareAccessOutput instance,
) => <String, dynamic>{
  'grantId': ?instance.grantId,
  'revision': ?GrantSoftwareAccessOutput._write_revision(instance.revision),
};
