// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/change_collection_access_command.dart';
import '../models/change_collection_access_output_data_output.dart';
import '../models/collection_details_output_data_output.dart';
import '../models/collection_list_output_data_output.dart';
import '../models/create_collection_command.dart';
import '../models/create_collection_output_data_output.dart';
import '../models/delete_collection_command.dart';
import '../models/delete_collection_output_data_output.dart';
import '../models/grant_collection_access_command.dart';
import '../models/grant_collection_access_output_data_output.dart';
import '../models/revoke_collection_access_command.dart';
import '../models/revoke_collection_access_output_data_output.dart';
import '../models/set_collection_membership_command.dart';
import '../models/set_collection_membership_output_data_output.dart';
import '../models/update_collection_command.dart';
import '../models/update_collection_output_data_output.dart';

part 'collections_client.g.dart';

@RestApi()
abstract class CollectionsClient {
  factory CollectionsClient(Dio dio, {String? baseUrl}) = _CollectionsClient;

  @DELETE('/api/collections/{id}/grants/{grantId}')
  Future<RevokeCollectionAccessOutputDataOutput>
  deleteApiCollectionsIdGrantsGrantId({
    @Path('id') required String id,
    @Path('grantId') required String grantId,
    @Body() required RevokeCollectionAccessCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/collections/{id}/grants/{grantId}')
  Future<ChangeCollectionAccessOutputDataOutput>
  putApiCollectionsIdGrantsGrantId({
    @Path('id') required String id,
    @Path('grantId') required String grantId,
    @Body() required ChangeCollectionAccessCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/collections/{id}/grants')
  Future<GrantCollectionAccessOutputDataOutput> postApiCollectionsIdGrants({
    @Path('id') required String id,
    @Body() required GrantCollectionAccessCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/collections/{id}/members')
  Future<SetCollectionMembershipOutputDataOutput> putApiCollectionsIdMembers({
    @Path('id') required String id,
    @Body() required SetCollectionMembershipCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @DELETE('/api/collections/{id}')
  Future<DeleteCollectionOutputDataOutput> deleteApiCollectionsId({
    @Path('id') required String id,
    @Body() required DeleteCollectionCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/collections/{id}')
  Future<UpdateCollectionOutputDataOutput> putApiCollectionsId({
    @Path('id') required String id,
    @Body() required UpdateCollectionCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/collections/{id}')
  Future<CollectionDetailsOutputDataOutput> getApiCollectionsId({
    @Path('id') required String id,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/collections')
  Future<CollectionListOutputDataOutput> getApiCollections({
    @Query('pageSize') String? pageSize,
    @Query('cursor') String? cursor,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/collections')
  Future<CreateCollectionOutputDataOutput> postApiCollections({
    @Body() required CreateCollectionCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
