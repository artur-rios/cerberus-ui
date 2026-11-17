// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/account_export_archive.dart';
import '../models/account_export_input.dart';

part 'account_export_client.g.dart';

@RestApi()
abstract class AccountExportClient {
  factory AccountExportClient(Dio dio, {String? baseUrl}) =
      _AccountExportClient;

  @POST('/api/accounts/me/export')
  Future<AccountExportArchive> postApiAccountsMeExport({
    @Header('X-Cerberus-Vault-Access') required String xCerberusVaultAccess,
    @Body() required AccountExportInput body,
  });
}
