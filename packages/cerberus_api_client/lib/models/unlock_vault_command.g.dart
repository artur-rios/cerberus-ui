// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlock_vault_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnlockVaultCommand _$UnlockVaultCommandFromJson(Map<String, dynamic> json) =>
    UnlockVaultCommand(
      expectedProtectionRevision: (json['expectedProtectionRevision'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$UnlockVaultCommandToJson(UnlockVaultCommand instance) =>
    <String, dynamic>{
      'expectedProtectionRevision': instance.expectedProtectionRevision,
    };
