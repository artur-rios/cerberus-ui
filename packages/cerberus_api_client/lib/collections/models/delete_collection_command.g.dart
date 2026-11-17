// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_collection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCollectionCommand _$DeleteCollectionCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return DeleteCollectionCommand(
    expectedRevision: DeleteCollectionCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$DeleteCollectionCommandToJson(
  DeleteCollectionCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?DeleteCollectionCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
