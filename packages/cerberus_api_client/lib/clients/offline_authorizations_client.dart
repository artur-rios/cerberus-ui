// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/offline_authorization_output_data_output.dart';
import '../models/renew_offline_authorization_command.dart';

part 'offline_authorizations_client.g.dart';

@RestApi()
abstract class OfflineAuthorizationsClient {
  factory OfflineAuthorizationsClient(Dio dio, {String? baseUrl}) =
      _OfflineAuthorizationsClient;

  @POST('/api/offline-authorizations')
  Future<OfflineAuthorizationOutputDataOutput> postApiOfflineAuthorizations({
    @Body() required RenewOfflineAuthorizationCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
