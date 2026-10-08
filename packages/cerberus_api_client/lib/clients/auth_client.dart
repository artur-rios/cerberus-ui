// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/authentication_output_data_output.dart';
import '../models/login_command.dart';
import '../models/verify_challenge_command.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST('/api/auth/login')
  Future<AuthenticationOutputDataOutput> postApiAuthLogin({
    @Body() LoginCommand? body,
  });

  @POST('/api/auth/2fa/verify')
  Future<AuthenticationOutputDataOutput> postApiAuth2faVerify({
    @Body() VerifyChallengeCommand? body,
  });
}
