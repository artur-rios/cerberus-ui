// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_create_input.dart';
import 'folder_create_input.dart';
import 'profile_create_input.dart';
import 'record_create_input.dart';
import 'sync_collection_create_edit_type.dart';
import 'sync_collection_update_edit_type.dart';
import 'sync_content_edit_input.dart';
import 'sync_folder_create_edit_type.dart';
import 'sync_folder_update_edit_type.dart';
import 'sync_profile_create_edit_type.dart';
import 'sync_profile_update_edit_type.dart';
import 'sync_record_create_edit_type.dart';
import 'sync_record_update_edit_type.dart';
import 'sync_record_create.dart';
import 'sync_record_update.dart';
import 'sync_folder_create.dart';
import 'sync_folder_update.dart';
import 'sync_collection_create.dart';
import 'sync_collection_update.dart';
import 'sync_profile_create.dart';
import 'sync_profile_update.dart';

part 'upload_sync_edits_command_edits_sealed.g.dart';

@JsonSerializable(createFactory: false)
sealed class UploadSyncEditsCommandEditsSealed {
  const UploadSyncEditsCommandEditsSealed();

  factory UploadSyncEditsCommandEditsSealed.fromJson(
    Map<String, dynamic> json,
  ) => UploadSyncEditsCommandEditsSealedDeserializer.tryDeserialize(json);

  Map<String, dynamic> toJson();
}

extension UploadSyncEditsCommandEditsSealedDeserializer
    on UploadSyncEditsCommandEditsSealed {
  static UploadSyncEditsCommandEditsSealed tryDeserialize(
    Map<String, dynamic> json,
  ) {
    try {
      return UploadSyncEditsCommandEditsSealedSyncRecordCreate.fromJson(json);
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncRecordUpdate.fromJson(json);
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncFolderCreate.fromJson(json);
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncFolderUpdate.fromJson(json);
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncCollectionCreate.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncCollectionUpdate.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncProfileCreate.fromJson(json);
    } catch (_) {}
    try {
      return UploadSyncEditsCommandEditsSealedSyncProfileUpdate.fromJson(json);
    } catch (_) {}

    throw FormatException(
      'Could not determine the correct type for UploadSyncEditsCommandEditsSealed from: $json',
    );
  }
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncRecordCreate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncRecordCreate {
  @override
  final RecordCreateInput input;
  @override
  final String operationId;
  @override
  final SyncRecordCreateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncRecordCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncRecordCreate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncRecordCreateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncRecordCreateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncRecordUpdate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncRecordUpdate {
  @override
  final SyncContentEditInput input;
  @override
  final String operationId;
  @override
  final SyncRecordUpdateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncRecordUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncRecordUpdate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncRecordUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncRecordUpdateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncFolderCreate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncFolderCreate {
  @override
  final FolderCreateInput input;
  @override
  final String operationId;
  @override
  final SyncFolderCreateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncFolderCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncFolderCreate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncFolderCreateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncFolderCreateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncFolderUpdate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncFolderUpdate {
  @override
  final SyncContentEditInput input;
  @override
  final String operationId;
  @override
  final SyncFolderUpdateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncFolderUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncFolderUpdate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncFolderUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncFolderUpdateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncCollectionCreate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncCollectionCreate {
  @override
  final CollectionCreateInput input;
  @override
  final String operationId;
  @override
  final SyncCollectionCreateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncCollectionCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncCollectionCreate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncCollectionCreateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncCollectionCreateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncCollectionUpdate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncCollectionUpdate {
  @override
  final SyncContentEditInput input;
  @override
  final String operationId;
  @override
  final SyncCollectionUpdateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncCollectionUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncCollectionUpdate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncCollectionUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncCollectionUpdateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncProfileCreate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncProfileCreate {
  @override
  final ProfileCreateInput input;
  @override
  final String operationId;
  @override
  final SyncProfileCreateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncProfileCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncProfileCreate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncProfileCreateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncProfileCreateToJson(this);
}

@JsonSerializable()
class UploadSyncEditsCommandEditsSealedSyncProfileUpdate
    extends UploadSyncEditsCommandEditsSealed
    implements SyncProfileUpdate {
  @override
  final SyncContentEditInput input;
  @override
  final String operationId;
  @override
  final SyncProfileUpdateEditType editType;

  const UploadSyncEditsCommandEditsSealedSyncProfileUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory UploadSyncEditsCommandEditsSealedSyncProfileUpdate.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadSyncEditsCommandEditsSealedSyncProfileUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$UploadSyncEditsCommandEditsSealedSyncProfileUpdateToJson(this);
}
