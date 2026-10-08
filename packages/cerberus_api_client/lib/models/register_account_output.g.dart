// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountOutput _$RegisterAccountOutputFromJson(
  Map<String, dynamic> json,
) => RegisterAccountOutput(
  id: json['id'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  onboardingState: json['onboardingState'] as String?,
  replayed: json['replayed'] as bool?,
);

Map<String, dynamic> _$RegisterAccountOutputToJson(
  RegisterAccountOutput instance,
) => <String, dynamic>{
  'id': instance.id,
  'revision': instance.revision,
  'onboardingState': instance.onboardingState,
  'replayed': instance.replayed,
};
