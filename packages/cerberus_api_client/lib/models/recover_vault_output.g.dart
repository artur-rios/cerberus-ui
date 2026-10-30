// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_vault_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverVaultOutput _$RecoverVaultOutputFromJson(Map<String, dynamic> json) =>
    RecoverVaultOutput(
      status: json['status'] as String?,
      protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
      generation: (json['generation'] as num?)?.toInt(),
      revocationGeneration: (json['revocationGeneration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RecoverVaultOutputToJson(RecoverVaultOutput instance) =>
    <String, dynamic>{
      'status': instance.status,
      'protectionRevision': instance.protectionRevision,
      'generation': instance.generation,
      'revocationGeneration': instance.revocationGeneration,
    };
