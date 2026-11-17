// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountOutput _$UpdateAccountOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'revision'],
    disallowNullValues: const ['id', 'revision'],
  );
  return UpdateAccountOutput(
    id: json['id'] as String?,
    revision: UpdateAccountOutput._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$UpdateAccountOutputToJson(
  UpdateAccountOutput instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'revision': ?UpdateAccountOutput._write_revision(instance.revision),
};
