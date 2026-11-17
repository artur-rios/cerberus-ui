// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_account_entry_type.dart';
import 'account_export_collection_entry_type.dart';
import 'account_export_collection_grant_access.dart';
import 'account_export_collection_grant_entry_type.dart';
import 'account_export_collection_grant_state.dart';
import 'account_export_folder_entry_type.dart';
import 'account_export_profile_entry_type.dart';
import 'account_export_protection_entry_type.dart';
import 'account_export_record_entry_type.dart';
import 'account_export_relationship_entry_type.dart';
import 'account_export_relationship_relationship_kind.dart';
import 'account_export_relationship_source_kind.dart';
import 'account_export_relationship_target_kind.dart';
import 'account_export_shared_reference_access.dart';
import 'account_export_shared_reference_entry_type.dart';
import 'account_export_software_grant_entry_type.dart';
import 'account_export_software_grant_state.dart';
import 'account_export_software_target_entry_type.dart';
import 'account_export_software_target_resource_kind.dart';
import 'account_export_trash_operation_entry_type.dart';
import 'account_export_trash_operation_root_kind.dart';
import 'account_export_account.dart';
import 'account_export_protection.dart';
import 'account_export_profile.dart';
import 'account_export_record.dart';
import 'account_export_folder.dart';
import 'account_export_collection.dart';
import 'account_export_relationship.dart';
import 'account_export_collection_grant.dart';
import 'account_export_shared_reference.dart';
import 'account_export_software_grant.dart';
import 'account_export_software_target.dart';
import 'account_export_trash_operation.dart';

part 'account_export_archive_entries_sealed.g.dart';

@JsonSerializable(createFactory: false)
sealed class AccountExportArchiveEntriesSealed {
  const AccountExportArchiveEntriesSealed();

  factory AccountExportArchiveEntriesSealed.fromJson(
    Map<String, dynamic> json,
  ) => AccountExportArchiveEntriesSealedDeserializer.tryDeserialize(json);

  Map<String, dynamic> toJson();
}

extension AccountExportArchiveEntriesSealedDeserializer
    on AccountExportArchiveEntriesSealed {
  static AccountExportArchiveEntriesSealed tryDeserialize(
    Map<String, dynamic> json,
  ) {
    try {
      return AccountExportArchiveEntriesSealedAccountExportAccount.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportProtection.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportProfile.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportRecord.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportFolder.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportCollection.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportRelationship.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportCollectionGrant.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportSharedReference.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportSoftwareGrant.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportSoftwareTarget.fromJson(
        json,
      );
    } catch (_) {}
    try {
      return AccountExportArchiveEntriesSealedAccountExportTrashOperation.fromJson(
        json,
      );
    } catch (_) {}

    throw FormatException(
      'Could not determine the correct type for AccountExportArchiveEntriesSealed from: $json',
    );
  }
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportAccount
    extends AccountExportArchiveEntriesSealed
    implements AccountExportAccount {
  @override
  final String? details;
  @override
  final AccountExportAccountEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportAccount({
    required this.details,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportAccount.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportAccountFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportAccountToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportProtection
    extends AccountExportArchiveEntriesSealed
    implements AccountExportProtection {
  @override
  final int revision;
  @override
  final int keyEpoch;
  @override
  final int recoveryGeneration;
  @override
  final String? material;
  @override
  final AccountExportProtectionEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportProtection({
    required this.revision,
    required this.keyEpoch,
    required this.recoveryGeneration,
    required this.material,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportProtection.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportProtectionFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportProtectionToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportProfile
    extends AccountExportArchiveEntriesSealed
    implements AccountExportProfile {
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? purgeAt;
  @override
  final String? envelope;
  @override
  final String? keyWrappers;
  @override
  final AccountExportProfileEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportProfile({
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.keyWrappers,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportProfile.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportProfileToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportRecord
    extends AccountExportArchiveEntriesSealed
    implements AccountExportRecord {
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? purgeAt;
  @override
  final String? envelope;
  @override
  final String? folderId;
  @override
  final AccountExportRecordEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportRecord({
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.folderId,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportRecord.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportRecordFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportRecordToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportFolder
    extends AccountExportArchiveEntriesSealed
    implements AccountExportFolder {
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? purgeAt;
  @override
  final String? envelope;
  @override
  final String? parentFolderId;
  @override
  final AccountExportFolderEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportFolder({
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.parentFolderId,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportFolder.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportFolderFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportFolderToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportCollection
    extends AccountExportArchiveEntriesSealed
    implements AccountExportCollection {
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? purgeAt;
  @override
  final String? envelope;
  @override
  final int keyEpoch;
  @override
  final AccountExportCollectionEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportCollection({
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.keyEpoch,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportCollection.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportCollectionFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportCollectionToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportRelationship
    extends AccountExportArchiveEntriesSealed
    implements AccountExportRelationship {
  @override
  final AccountExportRelationshipRelationshipKind relationshipKind;
  @override
  final AccountExportRelationshipSourceKind sourceKind;
  @override
  final String sourceId;
  @override
  final AccountExportRelationshipTargetKind targetKind;
  @override
  final String targetId;
  @override
  final String? operationId;
  @override
  final AccountExportRelationshipEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportRelationship({
    required this.relationshipKind,
    required this.sourceKind,
    required this.sourceId,
    required this.targetKind,
    required this.targetId,
    required this.operationId,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportRelationship.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportRelationshipFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportRelationshipToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportCollectionGrant
    extends AccountExportArchiveEntriesSealed
    implements AccountExportCollectionGrant {
  @override
  final String grantId;
  @override
  final String collectionId;
  @override
  final String recipientAccountId;
  @override
  final AccountExportCollectionGrantAccess access;
  @override
  final AccountExportCollectionGrantState state;
  @override
  final int revision;
  @override
  final String? recipientKeyEnvelope;
  @override
  final AccountExportCollectionGrantEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportCollectionGrant({
    required this.grantId,
    required this.collectionId,
    required this.recipientAccountId,
    required this.access,
    required this.state,
    required this.revision,
    required this.recipientKeyEnvelope,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportCollectionGrant.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportCollectionGrantFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportCollectionGrantToJson(
        this,
      );
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportSharedReference
    extends AccountExportArchiveEntriesSealed
    implements AccountExportSharedReference {
  @override
  final String collectionId;
  @override
  final String ownerAccountId;
  @override
  final String grantId;
  @override
  final int grantRevision;
  @override
  final AccountExportSharedReferenceAccess access;
  @override
  final AccountExportSharedReferenceEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportSharedReference({
    required this.collectionId,
    required this.ownerAccountId,
    required this.grantId,
    required this.grantRevision,
    required this.access,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportSharedReference.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportSharedReferenceFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportSharedReferenceToJson(
        this,
      );
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportSoftwareGrant
    extends AccountExportArchiveEntriesSealed
    implements AccountExportSoftwareGrant {
  @override
  final String grantId;
  @override
  final String softwareId;
  @override
  final AccountExportSoftwareGrantState state;
  @override
  final int revision;
  @override
  final String? recipientKey;
  @override
  final AccountExportSoftwareGrantEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportSoftwareGrant({
    required this.grantId,
    required this.softwareId,
    required this.state,
    required this.revision,
    required this.recipientKey,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportSoftwareGrant.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportSoftwareGrantFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportSoftwareGrantToJson(this);
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportSoftwareTarget
    extends AccountExportArchiveEntriesSealed
    implements AccountExportSoftwareTarget {
  @override
  final String grantId;
  @override
  final AccountExportSoftwareTargetResourceKind resourceKind;
  @override
  final String resourceId;
  @override
  final String? recipientKeyEnvelope;
  @override
  final AccountExportSoftwareTargetEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportSoftwareTarget({
    required this.grantId,
    required this.resourceKind,
    required this.resourceId,
    required this.recipientKeyEnvelope,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportSoftwareTarget.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportSoftwareTargetFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportSoftwareTargetToJson(
        this,
      );
}

@JsonSerializable()
class AccountExportArchiveEntriesSealedAccountExportTrashOperation
    extends AccountExportArchiveEntriesSealed
    implements AccountExportTrashOperation {
  @override
  final String operationId;
  @override
  final AccountExportTrashOperationRootKind rootKind;
  @override
  final String rootId;
  @override
  final DateTime deletedAt;
  @override
  final DateTime purgeAt;
  @override
  final AccountExportTrashOperationEntryType entryType;

  const AccountExportArchiveEntriesSealedAccountExportTrashOperation({
    required this.operationId,
    required this.rootKind,
    required this.rootId,
    required this.deletedAt,
    required this.purgeAt,
    required this.entryType,
  });

  factory AccountExportArchiveEntriesSealedAccountExportTrashOperation.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountExportArchiveEntriesSealedAccountExportTrashOperationFromJson(
    json,
  );

  @override
  Map<String, dynamic> toJson() =>
      _$AccountExportArchiveEntriesSealedAccountExportTrashOperationToJson(
        this,
      );
}
