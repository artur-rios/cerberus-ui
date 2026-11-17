// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_vault_protection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeVaultProtectionCommand _$ChangeVaultProtectionCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'expectedProtectionRevision',
      'expectedAccountRevision',
      'mode',
      'material',
      'contentReplacements',
      'grantReplacements',
    ],
    disallowNullValues: const [
      'accountId',
      'expectedProtectionRevision',
      'expectedAccountRevision',
      'material',
    ],
  );
  return ChangeVaultProtectionCommand(
    accountId: json['accountId'] as String?,
    expectedProtectionRevision:
        ChangeVaultProtectionCommand._read_expectedProtectionRevision(
          json['expectedProtectionRevision'],
        ),
    expectedAccountRevision:
        ChangeVaultProtectionCommand._read_expectedAccountRevision(
          json['expectedAccountRevision'],
        ),
    mode: json['mode'] as String?,
    material: json['material'] == null
        ? null
        : ProtectionMaterial.fromJson(json['material'] as Map<String, dynamic>),
    contentReplacements: (json['contentReplacements'] as List<dynamic>?)
        ?.map((e) => ContentReplacement.fromJson(e as Map<String, dynamic>))
        .toList(),
    grantReplacements: (json['grantReplacements'] as List<dynamic>?)
        ?.map(
          (e) => CollectionGrantReplacement.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
  );
}

Map<String, dynamic> _$ChangeVaultProtectionCommandToJson(
  ChangeVaultProtectionCommand instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'expectedProtectionRevision':
      ?ChangeVaultProtectionCommand._write_expectedProtectionRevision(
        instance.expectedProtectionRevision,
      ),
  'expectedAccountRevision':
      ?ChangeVaultProtectionCommand._write_expectedAccountRevision(
        instance.expectedAccountRevision,
      ),
  'mode': ?instance.mode,
  'material': ?instance.material?.toJson(),
  'contentReplacements': ?instance.contentReplacements
      ?.map((e) => e.toJson())
      .toList(),
  'grantReplacements': ?instance.grantReplacements
      ?.map((e) => e.toJson())
      .toList(),
};
