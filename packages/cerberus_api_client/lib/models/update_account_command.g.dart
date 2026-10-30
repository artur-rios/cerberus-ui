// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountCommand _$UpdateAccountCommandFromJson(
  Map<String, dynamic> json,
) => UpdateAccountCommand(
  expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
  details: json['details'] == null
      ? null
      : EncryptedEnvelope.fromJson(json['details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateAccountCommandToJson(
  UpdateAccountCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'details': instance.details,
};
