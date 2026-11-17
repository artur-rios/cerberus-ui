// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_vault_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializeVaultCommand _$InitializeVaultCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'expectedAccountRevision', 'material'],
    disallowNullValues: const [
      'accountId',
      'expectedAccountRevision',
      'material',
    ],
  );
  return InitializeVaultCommand(
    accountId: json['accountId'] as String?,
    expectedAccountRevision:
        InitializeVaultCommand._read_expectedAccountRevision(
          json['expectedAccountRevision'],
        ),
    material: json['material'] == null
        ? null
        : ProtectionMaterial.fromJson(json['material'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InitializeVaultCommandToJson(
  InitializeVaultCommand instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'expectedAccountRevision':
      ?InitializeVaultCommand._write_expectedAccountRevision(
        instance.expectedAccountRevision,
      ),
  'material': ?instance.material?.toJson(),
};
