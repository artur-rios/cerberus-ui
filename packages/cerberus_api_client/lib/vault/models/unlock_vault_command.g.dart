// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlock_vault_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnlockVaultCommand _$UnlockVaultCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedProtectionRevision'],
    disallowNullValues: const ['expectedProtectionRevision'],
  );
  return UnlockVaultCommand(
    expectedProtectionRevision:
        UnlockVaultCommand._read_expectedProtectionRevision(
          json['expectedProtectionRevision'],
        ),
  );
}

Map<String, dynamic> _$UnlockVaultCommandToJson(UnlockVaultCommand instance) =>
    <String, dynamic>{
      'expectedProtectionRevision':
          ?UnlockVaultCommand._write_expectedProtectionRevision(
            instance.expectedProtectionRevision,
          ),
    };
