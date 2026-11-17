// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'software_grant_target_input.dart';
import 'software_recipient_key.dart';

part 'grant_software_access_command.g.dart';

@JsonSerializable()
class GrantSoftwareAccessCommand {
  const GrantSoftwareAccessCommand({
    required this.grantId,
    required this.softwareIdentityId,
    required this.expectedRevision,
    required this.recipientKey,
    required this.targets,
  });

  factory GrantSoftwareAccessCommand.fromJson(Map<String, Object?> json) =>
      _$GrantSoftwareAccessCommandFromJson(json);

  final String grantId;
  final String softwareIdentityId;
  final int? expectedRevision;
  final SoftwareRecipientKey recipientKey;
  final List<SoftwareGrantTargetInput>? targets;

  Map<String, Object?> toJson() => _$GrantSoftwareAccessCommandToJson(this);
}
