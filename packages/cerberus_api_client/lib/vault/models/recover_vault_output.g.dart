// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_vault_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverVaultOutput _$RecoverVaultOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'status',
      'protectionRevision',
      'generation',
      'revocationGeneration',
    ],
    disallowNullValues: const [
      'protectionRevision',
      'generation',
      'revocationGeneration',
    ],
  );
  return RecoverVaultOutput(
    status: json['status'] as String?,
    protectionRevision: RecoverVaultOutput._read_protectionRevision(
      json['protectionRevision'],
    ),
    generation: RecoverVaultOutput._read_generation(json['generation']),
    revocationGeneration: RecoverVaultOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
  );
}

Map<String, dynamic> _$RecoverVaultOutputToJson(RecoverVaultOutput instance) =>
    <String, dynamic>{
      'status': ?instance.status,
      'protectionRevision': ?RecoverVaultOutput._write_protectionRevision(
        instance.protectionRevision,
      ),
      'generation': ?RecoverVaultOutput._write_generation(instance.generation),
      'revocationGeneration': ?RecoverVaultOutput._write_revocationGeneration(
        instance.revocationGeneration,
      ),
    };
