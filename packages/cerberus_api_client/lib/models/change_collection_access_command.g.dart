// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_collection_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeCollectionAccessCommand _$ChangeCollectionAccessCommandFromJson(
  Map<String, dynamic> json,
) => ChangeCollectionAccessCommand(
  expectedRevision: (json['expectedRevision'] as num).toInt(),
  access: json['access'] as String?,
  keyEnvelope: RecipientEnvelope.fromJson(
    json['keyEnvelope'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ChangeCollectionAccessCommandToJson(
  ChangeCollectionAccessCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'access': instance.access,
  'keyEnvelope': instance.keyEnvelope,
};
