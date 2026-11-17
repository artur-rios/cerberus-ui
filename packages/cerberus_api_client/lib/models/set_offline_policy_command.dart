// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'set_offline_policy_command.g.dart';

@JsonSerializable()
class SetOfflinePolicyCommand {
  const SetOfflinePolicyCommand({
    required this.expectedPolicyRevision,
    required this.renewalEnabled,
    required this.renewalInterval,
  });

  factory SetOfflinePolicyCommand.fromJson(Map<String, Object?> json) =>
      _$SetOfflinePolicyCommandFromJson(json);

  final int expectedPolicyRevision;
  final bool renewalEnabled;
  final String? renewalInterval;

  Map<String, Object?> toJson() => _$SetOfflinePolicyCommandToJson(this);
}
