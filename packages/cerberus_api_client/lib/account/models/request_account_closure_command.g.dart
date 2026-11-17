// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_account_closure_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAccountClosureCommand _$RequestAccountClosureCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return RequestAccountClosureCommand(
    expectedRevision: RequestAccountClosureCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$RequestAccountClosureCommandToJson(
  RequestAccountClosureCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?RequestAccountClosureCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
