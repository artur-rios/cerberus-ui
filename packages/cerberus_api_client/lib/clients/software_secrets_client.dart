// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/software_secret_output_data_output.dart';

part 'software_secrets_client.g.dart';

@RestApi()
abstract class SoftwareSecretsClient {
  factory SoftwareSecretsClient(Dio dio, {String? baseUrl}) =
      _SoftwareSecretsClient;

  @GET('/api/software-secrets')
  Future<SoftwareSecretOutputDataOutput> getApiSoftwareSecrets({
    @Query('grantId') required String grantId,
    @Query('kind') required String kind,
    @Query('id') required String id,
    @Query('collectionId') String? collectionId,
  });
}
