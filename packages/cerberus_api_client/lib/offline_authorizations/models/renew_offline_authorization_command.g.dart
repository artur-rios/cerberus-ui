// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_offline_authorization_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewOfflineAuthorizationCommand _$RenewOfflineAuthorizationCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['profileId', 'expectedProfileRevision'],
    requiredKeys: const ['profileId', 'expectedProfileRevision'],
    disallowNullValues: const ['profileId', 'expectedProfileRevision'],
  );
  return RenewOfflineAuthorizationCommand(
    profileId: json['profileId'] as String,
    expectedProfileRevision:
        RenewOfflineAuthorizationCommand._read_expectedProfileRevision(
          json['expectedProfileRevision'],
        ),
  );
}

Map<String, dynamic> _$RenewOfflineAuthorizationCommandToJson(
  RenewOfflineAuthorizationCommand instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'expectedProfileRevision':
      ?RenewOfflineAuthorizationCommand._write_expectedProfileRevision(
        instance.expectedProfileRevision,
      ),
};
