// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure_recovery_authentication_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosureRecoveryAuthenticationOutput
_$ClosureRecoveryAuthenticationOutputFromJson(Map<String, dynamic> json) =>
    ClosureRecoveryAuthenticationOutput(
      identity: HeimdallLogin.fromJson(
        json['identity'] as Map<String, dynamic>,
      ),
      account: json['account'] == null
          ? null
          : AccountClosureRecoveryDetails.fromJson(
              json['account'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ClosureRecoveryAuthenticationOutputToJson(
  ClosureRecoveryAuthenticationOutput instance,
) => <String, dynamic>{
  'identity': instance.identity,
  'account': instance.account,
};
