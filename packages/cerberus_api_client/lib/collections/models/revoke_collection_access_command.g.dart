// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_collection_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeCollectionAccessCommand _$RevokeCollectionAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return RevokeCollectionAccessCommand(
    expectedRevision: RevokeCollectionAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$RevokeCollectionAccessCommandToJson(
  RevokeCollectionAccessCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?RevokeCollectionAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
