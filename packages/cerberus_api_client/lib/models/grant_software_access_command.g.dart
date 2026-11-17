// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_software_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantSoftwareAccessCommand _$GrantSoftwareAccessCommandFromJson(
  Map<String, dynamic> json,
) => GrantSoftwareAccessCommand(
  grantId: json['grantId'] as String,
  softwareIdentityId: json['softwareIdentityId'] as String,
  expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
  recipientKey: SoftwareRecipientKey.fromJson(
    json['recipientKey'] as Map<String, dynamic>,
  ),
  targets: (json['targets'] as List<dynamic>?)
      ?.map((e) => SoftwareGrantTargetInput.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GrantSoftwareAccessCommandToJson(
  GrantSoftwareAccessCommand instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'softwareIdentityId': instance.softwareIdentityId,
  'expectedRevision': instance.expectedRevision,
  'recipientKey': instance.recipientKey,
  'targets': instance.targets,
};
