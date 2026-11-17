// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/health_details.dart';
import '../models/health_status.dart';

part 'health_client.g.dart';

@RestApi()
abstract class HealthClient {
  factory HealthClient(Dio dio, {String? baseUrl}) = _HealthClient;

  @GET('/health/live')
  Future<HealthStatus> getHealthLive();

  @GET('/health/ready')
  Future<HealthStatus> getHealthReady();

  @GET('/health/details')
  Future<HealthDetails> getHealthDetails();
}
