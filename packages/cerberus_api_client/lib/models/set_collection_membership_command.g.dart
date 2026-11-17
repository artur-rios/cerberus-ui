// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_collection_membership_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetCollectionMembershipCommand _$SetCollectionMembershipCommandFromJson(
  Map<String, dynamic> json,
) => SetCollectionMembershipCommand(
  expectedRevision: (json['expectedRevision'] as num).toInt(),
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  editedAt: DateTime.parse(json['editedAt'] as String),
  recordIds: (json['recordIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  folderIds: (json['folderIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SetCollectionMembershipCommandToJson(
  SetCollectionMembershipCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
