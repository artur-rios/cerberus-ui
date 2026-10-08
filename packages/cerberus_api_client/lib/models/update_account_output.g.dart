// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountOutput _$UpdateAccountOutputFromJson(Map<String, dynamic> json) =>
    UpdateAccountOutput(
      id: json['id'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateAccountOutputToJson(
  UpdateAccountOutput instance,
) => <String, dynamic>{'id': instance.id, 'revision': instance.revision};
