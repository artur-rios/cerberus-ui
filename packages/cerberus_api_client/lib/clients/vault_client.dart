// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/change_vault_protection_command.dart';
import '../models/change_vault_protection_output_data_output.dart';
import '../models/initialize_vault_command.dart';
import '../models/issue_vault_challenge_command.dart';
import '../models/recover_vault_command.dart';
import '../models/recover_vault_output_data_output.dart';
import '../models/unlock_vault_command.dart';
import '../models/vault_challenge_output_data_output.dart';
import '../models/vault_initialization_output_data_output.dart';
import '../models/vault_protection_output_data_output.dart';
import '../models/vault_unlock_output_data_output.dart';

part 'vault_client.g.dart';

@RestApi()
abstract class VaultClient {
  factory VaultClient(Dio dio, {String? baseUrl}) = _VaultClient;

  @POST('/api/vault/protection')
  Future<VaultInitializationOutputDataOutput> postApiVaultProtection({
    @Body() InitializeVaultCommand? body,
  });

  @PUT('/api/vault/protection')
  Future<ChangeVaultProtectionOutputDataOutput> putApiVaultProtection({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
    @Header('X-Cerberus-Challenge-Id') String? xCerberusChallengeId,
    @Header('X-Cerberus-Proof') String? xCerberusProof,
    @Body() ChangeVaultProtectionCommand? body,
  });

  @GET('/api/vault/protection')
  Future<VaultProtectionOutputDataOutput> getApiVaultProtection();

  @POST('/api/vault/recovery')
  Future<RecoverVaultOutputDataOutput> postApiVaultRecovery({
    @Header('X-Cerberus-Challenge-Id') String? xCerberusChallengeId,
    @Header('X-Cerberus-Proof') String? xCerberusProof,
    @Body() RecoverVaultCommand? body,
  });

  @PUT('/api/vault/recovery')
  Future<RecoverVaultOutputDataOutput> putApiVaultRecovery({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
    @Header('X-Cerberus-Challenge-Id') String? xCerberusChallengeId,
    @Header('X-Cerberus-Proof') String? xCerberusProof,
    @Body() RecoverVaultCommand? body,
  });

  @GET('/api/vault/recovery-material')
  Future<VaultProtectionOutputDataOutput> getApiVaultRecoveryMaterial();

  @POST('/api/vault/challenges')
  Future<VaultChallengeOutputDataOutput> postApiVaultChallenges({
    @Body() IssueVaultChallengeCommand? body,
  });

  @POST('/api/vault/unlock')
  Future<VaultUnlockOutputDataOutput> postApiVaultUnlock({
    @Header('X-Cerberus-Challenge-Id') String? xCerberusChallengeId,
    @Header('X-Cerberus-Proof') String? xCerberusProof,
    @Body() UnlockVaultCommand? body,
  });
}
