// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_access_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAccessMaterial _$ProfileAccessMaterialFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'profileId',
      'revision',
      'envelope',
      'keyWrappers',
    ],
    disallowNullValues: const [
      'accountId',
      'profileId',
      'revision',
      'envelope',
      'keyWrappers',
    ],
  );
  return ProfileAccessMaterial(
    accountId: json['accountId'] as String?,
    profileId: json['profileId'] as String?,
    revision: ProfileAccessMaterial._read_revision(json['revision']),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    keyWrappers: json['keyWrappers'] == null
        ? null
        : ProfileKeyWrappers.fromJson(
            json['keyWrappers'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$ProfileAccessMaterialToJson(
  ProfileAccessMaterial instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'profileId': ?instance.profileId,
  'revision': ?ProfileAccessMaterial._write_revision(instance.revision),
  'envelope': ?instance.envelope?.toJson(),
  'keyWrappers': ?instance.keyWrappers?.toJson(),
};
