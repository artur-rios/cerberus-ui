// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountCommand _$DeleteAccountCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return DeleteAccountCommand(
    expectedRevision: DeleteAccountCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$DeleteAccountCommandToJson(
  DeleteAccountCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?DeleteAccountCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
