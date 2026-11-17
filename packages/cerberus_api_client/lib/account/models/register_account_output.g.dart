// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountOutput _$RegisterAccountOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'revision', 'onboardingState', 'replayed'],
    disallowNullValues: const ['id', 'revision', 'replayed'],
  );
  return RegisterAccountOutput(
    id: json['id'] as String?,
    revision: RegisterAccountOutput._read_revision(json['revision']),
    onboardingState: json['onboardingState'] as String?,
    replayed: json['replayed'] as bool?,
  );
}

Map<String, dynamic> _$RegisterAccountOutputToJson(
  RegisterAccountOutput instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'revision': ?RegisterAccountOutput._write_revision(instance.revision),
  'onboardingState': ?instance.onboardingState,
  'replayed': ?instance.replayed,
};
