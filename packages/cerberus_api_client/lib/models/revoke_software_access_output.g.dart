// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_software_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeSoftwareAccessOutput _$RevokeSoftwareAccessOutputFromJson(
  Map<String, dynamic> json,
) => RevokeSoftwareAccessOutput(
  grantId: json['grantId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$RevokeSoftwareAccessOutputToJson(
  RevokeSoftwareAccessOutput instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'revision': instance.revision,
};
