// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_software_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantSoftwareAccessCommand _$GrantSoftwareAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'grantId',
      'softwareIdentityId',
      'expectedRevision',
      'recipientKey',
      'targets',
    ],
    requiredKeys: const [
      'grantId',
      'softwareIdentityId',
      'expectedRevision',
      'recipientKey',
      'targets',
    ],
    disallowNullValues: const ['grantId', 'softwareIdentityId', 'recipientKey'],
  );
  return GrantSoftwareAccessCommand(
    grantId: json['grantId'] as String,
    softwareIdentityId: json['softwareIdentityId'] as String,
    expectedRevision: GrantSoftwareAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    recipientKey: SoftwareRecipientKey.fromJson(
      json['recipientKey'] as Map<String, dynamic>,
    ),
    targets: (json['targets'] as List<dynamic>?)
        ?.map(
          (e) => SoftwareGrantTargetInput.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
  );
}

Map<String, dynamic> _$GrantSoftwareAccessCommandToJson(
  GrantSoftwareAccessCommand instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'softwareIdentityId': instance.softwareIdentityId,
  'expectedRevision': GrantSoftwareAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'recipientKey': instance.recipientKey.toJson(),
  'targets': instance.targets?.map((e) => e.toJson()).toList(),
};
