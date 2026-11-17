// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account_closure_cancellation_output_data_output.dart';
import '../models/account_closure_output_data_output.dart';
import '../models/account_deletion_output_data_output.dart';
import '../models/account_output_data_output.dart';
import '../models/cancel_account_closure_command.dart';
import '../models/delete_account_command.dart';
import '../models/offline_policy_output_data_output.dart';
import '../models/register_account_command.dart';
import '../models/register_account_output_data_output.dart';
import '../models/request_account_closure_command.dart';
import '../models/set_offline_policy_command.dart';
import '../models/set_offline_policy_output_data_output.dart';
import '../models/update_account_command.dart';
import '../models/update_account_output_data_output.dart';

part 'account_client.g.dart';

@RestApi()
abstract class AccountClient {
  factory AccountClient(Dio dio, {String? baseUrl}) = _AccountClient;

  @DELETE('/api/accounts/me/permanent')
  Future<AccountDeletionOutputDataOutput> deleteApiAccountsMePermanent({
    @Body() required DeleteAccountCommand body,
  });

  @POST('/api/accounts/me/closure/cancel')
  Future<AccountClosureCancellationOutputDataOutput>
  postApiAccountsMeClosureCancel({
    @Body() required CancelAccountClosureCommand body,
  });

  @POST('/api/accounts/me/closure')
  Future<AccountClosureOutputDataOutput> postApiAccountsMeClosure({
    @Body() required RequestAccountClosureCommand body,
  });

  @PUT('/api/accounts/me/offline-policy')
  Future<SetOfflinePolicyOutputDataOutput> putApiAccountsMeOfflinePolicy({
    @Body() required SetOfflinePolicyCommand body,
  });

  @GET('/api/accounts/me/offline-policy')
  Future<OfflinePolicyOutputDataOutput> getApiAccountsMeOfflinePolicy({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/accounts/me')
  Future<UpdateAccountOutputDataOutput> putApiAccountsMe({
    @Body() required UpdateAccountCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/accounts/me')
  Future<AccountOutputDataOutput> getApiAccountsMe({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/accounts')
  Future<RegisterAccountOutputDataOutput> postApiAccounts({
    @Body() required RegisterAccountCommand body,
  });
}
