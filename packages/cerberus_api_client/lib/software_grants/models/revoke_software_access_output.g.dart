// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_software_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeSoftwareAccessOutput _$RevokeSoftwareAccessOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['grantId', 'revision'],
    disallowNullValues: const ['grantId', 'revision'],
  );
  return RevokeSoftwareAccessOutput(
    grantId: json['grantId'] as String?,
    revision: RevokeSoftwareAccessOutput._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$RevokeSoftwareAccessOutputToJson(
  RevokeSoftwareAccessOutput instance,
) => <String, dynamic>{
  'grantId': ?instance.grantId,
  'revision': ?RevokeSoftwareAccessOutput._write_revision(instance.revision),
};
