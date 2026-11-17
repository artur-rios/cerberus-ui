// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/empty_trash_command.dart';
import '../models/empty_trash_output_data_output.dart';
import '../models/restore_trash_command.dart';
import '../models/restore_trash_output_data_output.dart';
import '../models/trash_list_output_data_output.dart';

part 'trash_client.g.dart';

@RestApi()
abstract class TrashClient {
  factory TrashClient(Dio dio, {String? baseUrl}) = _TrashClient;

  @DELETE('/api/trash')
  Future<EmptyTrashOutputDataOutput> deleteApiTrash({
    @Body() required EmptyTrashCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/trash')
  Future<TrashListOutputDataOutput> getApiTrash({
    @Query('pageSize') String? pageSize,
    @Query('cursor') String? cursor,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/trash/{id}/restore')
  Future<RestoreTrashOutputDataOutput> postApiTrashIdRestore({
    @Path('id') required String id,
    @Body() required RestoreTrashCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
