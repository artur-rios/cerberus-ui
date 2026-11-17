// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/create_profile_command.dart';
import '../models/create_profile_output_data_output.dart';
import '../models/delete_profile_command.dart';
import '../models/delete_profile_output_data_output.dart';
import '../models/issue_profile_access_challenge_command.dart';
import '../models/issue_profile_access_challenge_output_data_output.dart';
import '../models/open_profile_access_command.dart';
import '../models/open_profile_access_output_data_output.dart';
import '../models/profile_details_output_data_output.dart';
import '../models/profile_list_output_data_output.dart';
import '../models/set_profile_associations_command.dart';
import '../models/set_profile_associations_output_data_output.dart';
import '../models/update_profile_command.dart';
import '../models/update_profile_output_data_output.dart';

part 'profiles_client.g.dart';

@RestApi()
abstract class ProfilesClient {
  factory ProfilesClient(Dio dio, {String? baseUrl}) = _ProfilesClient;

  @POST('/api/profiles/{id}/access/challenges')
  Future<IssueProfileAccessChallengeOutputDataOutput>
  postApiProfilesIdAccessChallenges({
    @Path('id') required String id,
    @Body() required IssueProfileAccessChallengeCommand body,
  });

  @POST('/api/profiles/{id}/access')
  Future<OpenProfileAccessOutputDataOutput> postApiProfilesIdAccess({
    @Path('id') required String id,
    @Body() required OpenProfileAccessCommand body,
    @Header('X-Cerberus-Challenge-Id') String? xCerberusChallengeId,
    @Header('X-Cerberus-Proof') String? xCerberusProof,
  });

  @DELETE('/api/profiles/{id}')
  Future<DeleteProfileOutputDataOutput> deleteApiProfilesId({
    @Path('id') required String id,
    @Body() required DeleteProfileCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/profiles/{id}')
  Future<UpdateProfileOutputDataOutput> putApiProfilesId({
    @Path('id') required String id,
    @Body() required UpdateProfileCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/profiles/{id}')
  Future<ProfileDetailsOutputDataOutput> getApiProfilesId({
    @Path('id') required String id,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/profiles/{id}/associations')
  Future<SetProfileAssociationsOutputDataOutput> putApiProfilesIdAssociations({
    @Path('id') required String id,
    @Body() required SetProfileAssociationsCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/profiles')
  Future<ProfileListOutputDataOutput> getApiProfiles({
    @Query('pageSize') String? pageSize,
    @Query('cursor') String? cursor,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/profiles')
  Future<CreateProfileOutputDataOutput> postApiProfiles({
    @Body() required CreateProfileCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
