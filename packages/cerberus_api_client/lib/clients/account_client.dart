// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account_output_data_output.dart';
import '../models/register_account_command.dart';
import '../models/register_account_output_data_output.dart';

part 'account_client.g.dart';

@RestApi()
abstract class AccountClient {
  factory AccountClient(Dio dio, {String? baseUrl}) = _AccountClient;

  @GET('/api/accounts/me')
  Future<AccountOutputDataOutput> getApiAccountsMe({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/accounts')
  Future<RegisterAccountOutputDataOutput> postApiAccounts({
    @Body() RegisterAccountCommand? body,
  });
}
