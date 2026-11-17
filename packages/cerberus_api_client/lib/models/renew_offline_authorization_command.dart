// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'renew_offline_authorization_command.g.dart';

@JsonSerializable()
class RenewOfflineAuthorizationCommand {
  const RenewOfflineAuthorizationCommand({
    required this.profileId,
    required this.expectedProfileRevision,
  });

  factory RenewOfflineAuthorizationCommand.fromJson(
    Map<String, Object?> json,
  ) => _$RenewOfflineAuthorizationCommandFromJson(json);

  final String profileId;
  final int expectedProfileRevision;

  Map<String, Object?> toJson() =>
      _$RenewOfflineAuthorizationCommandToJson(this);
}
