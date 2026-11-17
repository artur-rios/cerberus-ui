// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'password_wrapper.dart';
import 'public_jwk.dart';
import 'recipient_envelope.dart';

part 'profile_key_wrappers.g.dart';

@JsonSerializable()
class ProfileKeyWrappers {
  const ProfileKeyWrappers({
    this.unlockMode,
    this.unlockVerifier,
    this.masterKeyWrapper,
    this.passwordWrapper,
  });

  factory ProfileKeyWrappers.fromJson(Map<String, Object?> json) =>
      _$ProfileKeyWrappersFromJson(json);

  final String? unlockMode;
  final PublicJwk? unlockVerifier;
  final RecipientEnvelope? masterKeyWrapper;
  final PasswordWrapper? passwordWrapper;

  Map<String, Object?> toJson() => _$ProfileKeyWrappersToJson(this);
}
