// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/create_record_command.dart';
import '../models/create_record_output_data_output.dart';
import '../models/delete_record_command.dart';
import '../models/delete_record_output_data_output.dart';
import '../models/move_record_command.dart';
import '../models/move_record_output_data_output.dart';
import '../models/permanently_delete_record_command.dart';
import '../models/permanently_delete_record_output_data_output.dart';
import '../models/record_details_output_data_output.dart';
import '../models/record_list_output_data_output.dart';
import '../models/update_record_command.dart';
import '../models/update_record_output_data_output.dart';

part 'records_client.g.dart';

@RestApi()
abstract class RecordsClient {
  factory RecordsClient(Dio dio, {String? baseUrl}) = _RecordsClient;

  @PUT('/api/records/{id}/folder')
  Future<MoveRecordOutputDataOutput> putApiRecordsIdFolder({
    @Path('id') required String id,
    @Body() required MoveRecordCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @DELETE('/api/records/{id}/permanent')
  Future<PermanentlyDeleteRecordOutputDataOutput> deleteApiRecordsIdPermanent({
    @Path('id') required String id,
    @Body() required PermanentlyDeleteRecordCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @DELETE('/api/records/{id}')
  Future<DeleteRecordOutputDataOutput> deleteApiRecordsId({
    @Path('id') required String id,
    @Body() required DeleteRecordCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @PUT('/api/records/{id}')
  Future<UpdateRecordOutputDataOutput> putApiRecordsId({
    @Path('id') required String id,
    @Body() required UpdateRecordCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/records/{id}')
  Future<RecordDetailsOutputDataOutput> getApiRecordsId({
    @Path('id') required String id,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @GET('/api/records')
  Future<RecordListOutputDataOutput> getApiRecords({
    @Query('pageSize') String? pageSize,
    @Query('cursor') String? cursor,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });

  @POST('/api/records')
  Future<CreateRecordOutputDataOutput> postApiRecords({
    @Body() required CreateRecordCommand body,
    @Header('X-Cerberus-Vault-Access') String? xCerberusVaultAccess,
  });
}
