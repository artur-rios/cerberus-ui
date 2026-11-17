// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_offline_authorization_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewOfflineAuthorizationCommand _$RenewOfflineAuthorizationCommandFromJson(
  Map<String, dynamic> json,
) => RenewOfflineAuthorizationCommand(
  profileId: json['profileId'] as String,
  expectedProfileRevision: (json['expectedProfileRevision'] as num).toInt(),
);

Map<String, dynamic> _$RenewOfflineAuthorizationCommandToJson(
  RenewOfflineAuthorizationCommand instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'expectedProfileRevision': instance.expectedProfileRevision,
};
