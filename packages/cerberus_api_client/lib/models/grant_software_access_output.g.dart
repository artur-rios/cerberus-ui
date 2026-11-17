// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_software_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantSoftwareAccessOutput _$GrantSoftwareAccessOutputFromJson(
  Map<String, dynamic> json,
) => GrantSoftwareAccessOutput(
  grantId: json['grantId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$GrantSoftwareAccessOutputToJson(
  GrantSoftwareAccessOutput instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'revision': instance.revision,
};
