// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/sync_changes_output_data_output.dart';
import '../models/sync_edits_output_data_output.dart';
import '../models/upload_sync_edits_command.dart';

part 'sync_client.g.dart';

@RestApi()
abstract class SyncClient {
  factory SyncClient(Dio dio, {String? baseUrl}) = _SyncClient;

  @POST('/api/sync/edits')
  Future<SyncEditsOutputDataOutput> postApiSyncEdits({
    @Body() required UploadSyncEditsCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/sync/changes')
  Future<SyncChangesOutputDataOutput> getApiSyncChanges({
    @Query('cursor') String? cursor,
    @Query('pageSize') int? pageSize,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
