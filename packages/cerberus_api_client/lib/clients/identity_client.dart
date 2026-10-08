// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/update_identity_command.dart';
import '../models/update_identity_output_data_output.dart';

part 'identity_client.g.dart';

@RestApi()
abstract class IdentityClient {
  factory IdentityClient(Dio dio, {String? baseUrl}) = _IdentityClient;

  @PUT('/api/identity/me')
  Future<UpdateIdentityOutputDataOutput> putApiIdentityMe({
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
    @Body() UpdateIdentityCommand? body,
  });
}
