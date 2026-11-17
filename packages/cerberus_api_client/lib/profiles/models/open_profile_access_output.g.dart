// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_profile_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenProfileAccessOutput _$OpenProfileAccessOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'vaultAccess',
      'issuedAt',
      'expiresAt',
      'profile',
    ],
    disallowNullValues: const ['accountId', 'issuedAt', 'profile'],
  );
  return OpenProfileAccessOutput(
    accountId: json['accountId'] as String?,
    vaultAccess: json['vaultAccess'] as String?,
    issuedAt: OpenProfileAccessOutput._read_issuedAt(json['issuedAt']),
    expiresAt: OpenProfileAccessOutput._read_expiresAt(json['expiresAt']),
    profile: json['profile'] == null
        ? null
        : ProfileAccessContext.fromJson(
            json['profile'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$OpenProfileAccessOutputToJson(
  OpenProfileAccessOutput instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'vaultAccess': ?instance.vaultAccess,
  'issuedAt': ?OpenProfileAccessOutput._write_issuedAt(instance.issuedAt),
  'expiresAt': ?OpenProfileAccessOutput._write_expiresAt(instance.expiresAt),
  'profile': ?instance.profile?.toJson(),
};
