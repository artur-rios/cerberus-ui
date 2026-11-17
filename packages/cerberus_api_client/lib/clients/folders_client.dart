// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/create_folder_command.dart';
import '../models/create_folder_output_data_output.dart';
import '../models/delete_folder_command.dart';
import '../models/delete_folder_output_data_output.dart';
import '../models/folder_details_output_data_output.dart';
import '../models/folder_list_output_data_output.dart';
import '../models/move_folder_command.dart';
import '../models/move_folder_output_data_output.dart';
import '../models/update_folder_command.dart';
import '../models/update_folder_output_data_output.dart';

part 'folders_client.g.dart';

@RestApi()
abstract class FoldersClient {
  factory FoldersClient(Dio dio, {String? baseUrl}) = _FoldersClient;

  @DELETE('/api/folders/{id}')
  Future<DeleteFolderOutputDataOutput> deleteApiFoldersId({
    @Path('id') required String id,
    @Body() required DeleteFolderCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/folders/{id}')
  Future<UpdateFolderOutputDataOutput> putApiFoldersId({
    @Path('id') required String id,
    @Body() required UpdateFolderCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/folders/{id}')
  Future<FolderDetailsOutputDataOutput> getApiFoldersId({
    @Path('id') required String id,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/folders/{id}/parent')
  Future<MoveFolderOutputDataOutput> putApiFoldersIdParent({
    @Path('id') required String id,
    @Body() required MoveFolderCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/folders')
  Future<FolderListOutputDataOutput> getApiFolders({
    @Query('pageSize') String? pageSize,
    @Query('cursor') String? cursor,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/folders')
  Future<CreateFolderOutputDataOutput> postApiFolders({
    @Body() required CreateFolderCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
