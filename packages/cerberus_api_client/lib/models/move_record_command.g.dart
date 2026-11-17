// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveRecordCommand _$MoveRecordCommandFromJson(Map<String, dynamic> json) =>
    MoveRecordCommand(
      expectedRevision: (json['expectedRevision'] as num).toInt(),
      folderId: json['folderId'] as String?,
    );

Map<String, dynamic> _$MoveRecordCommandToJson(MoveRecordCommand instance) =>
    <String, dynamic>{
      'expectedRevision': instance.expectedRevision,
      'folderId': instance.folderId,
    };
