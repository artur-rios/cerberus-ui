// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_profile_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenProfileAccessOutput _$OpenProfileAccessOutputFromJson(
  Map<String, dynamic> json,
) => OpenProfileAccessOutput(
  accountId: json['accountId'] as String?,
  vaultAccess: json['vaultAccess'] as String?,
  issuedAt: json['issuedAt'] == null
      ? null
      : DateTime.parse(json['issuedAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  profile: json['profile'] == null
      ? null
      : ProfileAccessContext.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OpenProfileAccessOutputToJson(
  OpenProfileAccessOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'vaultAccess': instance.vaultAccess,
  'issuedAt': instance.issuedAt?.toIso8601String(),
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'profile': instance.profile,
};
