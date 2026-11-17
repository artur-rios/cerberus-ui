// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_identity_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateIdentityOutput _$UpdateIdentityOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'name', 'email', 'emailVerified'],
    disallowNullValues: const ['id', 'emailVerified'],
  );
  return UpdateIdentityOutput(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerified: json['emailVerified'] as bool?,
  );
}

Map<String, dynamic> _$UpdateIdentityOutputToJson(
  UpdateIdentityOutput instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'emailVerified': ?instance.emailVerified,
};
