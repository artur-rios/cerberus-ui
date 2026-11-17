// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_account_closure_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelAccountClosureCommand _$CancelAccountClosureCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return CancelAccountClosureCommand(
    expectedRevision: CancelAccountClosureCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$CancelAccountClosureCommandToJson(
  CancelAccountClosureCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?CancelAccountClosureCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
