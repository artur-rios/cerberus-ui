// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/grant_software_access_command.dart';
import '../models/grant_software_access_output_data_output.dart';
import '../models/revoke_software_access_command.dart';
import '../models/revoke_software_access_output_data_output.dart';

part 'software_grants_client.g.dart';

@RestApi()
abstract class SoftwareGrantsClient {
  factory SoftwareGrantsClient(Dio dio, {String? baseUrl}) =
      _SoftwareGrantsClient;

  @DELETE('/api/software-grants/{id}')
  Future<RevokeSoftwareAccessOutputDataOutput> deleteApiSoftwareGrantsId({
    @Path('id') required String id,
    @Body() required RevokeSoftwareAccessCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/software-grants')
  Future<GrantSoftwareAccessOutputDataOutput> postApiSoftwareGrants({
    @Body() required GrantSoftwareAccessCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
