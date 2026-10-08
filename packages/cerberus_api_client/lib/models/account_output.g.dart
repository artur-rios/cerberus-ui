// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountOutput _$AccountOutputFromJson(Map<String, dynamic> json) =>
    AccountOutput(
      details: EncryptedEnvelope.fromJson(
        json['details'] as Map<String, dynamic>,
      ),
      id: json['id'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AccountOutputToJson(AccountOutput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'revision': instance.revision,
      'state': instance.state,
      'details': instance.details,
    };
