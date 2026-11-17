// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_archive_entries_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AccountExportArchiveEntriesSealedToJson(
  AccountExportArchiveEntriesSealed instance,
) => <String, dynamic>{};

AccountExportArchiveEntriesSealedAccountExportAccount
_$AccountExportArchiveEntriesSealedAccountExportAccountFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportAccount(
  details: json['details'] as String?,
  entryType: AccountExportAccountEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportAccountToJson(
  AccountExportArchiveEntriesSealedAccountExportAccount instance,
) => <String, dynamic>{
  'details': instance.details,
  'entryType': _$AccountExportAccountEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportAccountEntryTypeEnumMap = {
  AccountExportAccountEntryType.account: 'account',
  AccountExportAccountEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportProtection
_$AccountExportArchiveEntriesSealedAccountExportProtectionFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportProtection(
  revision: (json['revision'] as num).toInt(),
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  recoveryGeneration: (json['recoveryGeneration'] as num).toInt(),
  material: json['material'] as String?,
  entryType: AccountExportProtectionEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportProtectionToJson(
  AccountExportArchiveEntriesSealedAccountExportProtection instance,
) => <String, dynamic>{
  'revision': instance.revision,
  'keyEpoch': instance.keyEpoch,
  'recoveryGeneration': instance.recoveryGeneration,
  'material': instance.material,
  'entryType': _$AccountExportProtectionEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportProtectionEntryTypeEnumMap = {
  AccountExportProtectionEntryType.protection: 'protection',
  AccountExportProtectionEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportProfile
_$AccountExportArchiveEntriesSealedAccountExportProfileFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportProfile(
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
  envelope: json['envelope'] as String?,
  keyWrappers: json['keyWrappers'] as String?,
  entryType: AccountExportProfileEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportProfileToJson(
  AccountExportArchiveEntriesSealedAccountExportProfile instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'keyWrappers': instance.keyWrappers,
  'entryType': _$AccountExportProfileEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportProfileEntryTypeEnumMap = {
  AccountExportProfileEntryType.profile: 'profile',
  AccountExportProfileEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportRecord
_$AccountExportArchiveEntriesSealedAccountExportRecordFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportRecord(
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
  envelope: json['envelope'] as String?,
  folderId: json['folderId'] as String?,
  entryType: AccountExportRecordEntryType.fromJson(json['entryType'] as String),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportRecordToJson(
  AccountExportArchiveEntriesSealedAccountExportRecord instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'folderId': instance.folderId,
  'entryType': _$AccountExportRecordEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportRecordEntryTypeEnumMap = {
  AccountExportRecordEntryType.record: 'record',
  AccountExportRecordEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportFolder
_$AccountExportArchiveEntriesSealedAccountExportFolderFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportFolder(
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
  envelope: json['envelope'] as String?,
  parentFolderId: json['parentFolderId'] as String?,
  entryType: AccountExportFolderEntryType.fromJson(json['entryType'] as String),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportFolderToJson(
  AccountExportArchiveEntriesSealedAccountExportFolder instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'parentFolderId': instance.parentFolderId,
  'entryType': _$AccountExportFolderEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportFolderEntryTypeEnumMap = {
  AccountExportFolderEntryType.folder: 'folder',
  AccountExportFolderEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportCollection
_$AccountExportArchiveEntriesSealedAccountExportCollectionFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportCollection(
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
  envelope: json['envelope'] as String?,
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  entryType: AccountExportCollectionEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportCollectionToJson(
  AccountExportArchiveEntriesSealedAccountExportCollection instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'keyEpoch': instance.keyEpoch,
  'entryType': _$AccountExportCollectionEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportCollectionEntryTypeEnumMap = {
  AccountExportCollectionEntryType.collection: 'collection',
  AccountExportCollectionEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportRelationship
_$AccountExportArchiveEntriesSealedAccountExportRelationshipFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportRelationship(
  relationshipKind: AccountExportRelationshipRelationshipKind.fromJson(
    json['relationshipKind'] as String,
  ),
  sourceKind: AccountExportRelationshipSourceKind.fromJson(
    json['sourceKind'] as String,
  ),
  sourceId: json['sourceId'] as String,
  targetKind: AccountExportRelationshipTargetKind.fromJson(
    json['targetKind'] as String,
  ),
  targetId: json['targetId'] as String,
  operationId: json['operationId'] as String?,
  entryType: AccountExportRelationshipEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportRelationshipToJson(
  AccountExportArchiveEntriesSealedAccountExportRelationship instance,
) => <String, dynamic>{
  'relationshipKind':
      _$AccountExportRelationshipRelationshipKindEnumMap[instance
          .relationshipKind]!,
  'sourceKind':
      _$AccountExportRelationshipSourceKindEnumMap[instance.sourceKind]!,
  'sourceId': instance.sourceId,
  'targetKind':
      _$AccountExportRelationshipTargetKindEnumMap[instance.targetKind]!,
  'targetId': instance.targetId,
  'operationId': instance.operationId,
  'entryType': _$AccountExportRelationshipEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportRelationshipRelationshipKindEnumMap = {
  AccountExportRelationshipRelationshipKind.current: 'current',
  AccountExportRelationshipRelationshipKind.historical: 'historical',
  AccountExportRelationshipRelationshipKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipSourceKindEnumMap = {
  AccountExportRelationshipSourceKind.profile: 'profile',
  AccountExportRelationshipSourceKind.collection: 'collection',
  AccountExportRelationshipSourceKind.record: 'record',
  AccountExportRelationshipSourceKind.folder: 'folder',
  AccountExportRelationshipSourceKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipTargetKindEnumMap = {
  AccountExportRelationshipTargetKind.record: 'record',
  AccountExportRelationshipTargetKind.folder: 'folder',
  AccountExportRelationshipTargetKind.collection: 'collection',
  AccountExportRelationshipTargetKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipEntryTypeEnumMap = {
  AccountExportRelationshipEntryType.relationship: 'relationship',
  AccountExportRelationshipEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportCollectionGrant
_$AccountExportArchiveEntriesSealedAccountExportCollectionGrantFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportCollectionGrant(
  grantId: json['grantId'] as String,
  collectionId: json['collectionId'] as String,
  recipientAccountId: json['recipientAccountId'] as String,
  access: AccountExportCollectionGrantAccess.fromJson(json['access'] as String),
  state: AccountExportCollectionGrantState.fromJson(json['state'] as String),
  revision: (json['revision'] as num).toInt(),
  recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
  entryType: AccountExportCollectionGrantEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportCollectionGrantToJson(
  AccountExportArchiveEntriesSealedAccountExportCollectionGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'collectionId': instance.collectionId,
  'recipientAccountId': instance.recipientAccountId,
  'access': _$AccountExportCollectionGrantAccessEnumMap[instance.access]!,
  'state': _$AccountExportCollectionGrantStateEnumMap[instance.state]!,
  'revision': instance.revision,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType':
      _$AccountExportCollectionGrantEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportCollectionGrantAccessEnumMap = {
  AccountExportCollectionGrantAccess.readOnly: 'read-only',
  AccountExportCollectionGrantAccess.readWrite: 'read-write',
  AccountExportCollectionGrantAccess.$unknown: r'$unknown',
};

const _$AccountExportCollectionGrantStateEnumMap = {
  AccountExportCollectionGrantState.active: 'active',
  AccountExportCollectionGrantState.revoked: 'revoked',
  AccountExportCollectionGrantState.$unknown: r'$unknown',
};

const _$AccountExportCollectionGrantEntryTypeEnumMap = {
  AccountExportCollectionGrantEntryType.collectionGrant: 'collection-grant',
  AccountExportCollectionGrantEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportSharedReference
_$AccountExportArchiveEntriesSealedAccountExportSharedReferenceFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportSharedReference(
  collectionId: json['collectionId'] as String,
  ownerAccountId: json['ownerAccountId'] as String,
  grantId: json['grantId'] as String,
  grantRevision: (json['grantRevision'] as num).toInt(),
  access: AccountExportSharedReferenceAccess.fromJson(json['access'] as String),
  entryType: AccountExportSharedReferenceEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportSharedReferenceToJson(
  AccountExportArchiveEntriesSealedAccountExportSharedReference instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'ownerAccountId': instance.ownerAccountId,
  'grantId': instance.grantId,
  'grantRevision': instance.grantRevision,
  'access': _$AccountExportSharedReferenceAccessEnumMap[instance.access]!,
  'entryType':
      _$AccountExportSharedReferenceEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSharedReferenceAccessEnumMap = {
  AccountExportSharedReferenceAccess.readOnly: 'read-only',
  AccountExportSharedReferenceAccess.readWrite: 'read-write',
  AccountExportSharedReferenceAccess.$unknown: r'$unknown',
};

const _$AccountExportSharedReferenceEntryTypeEnumMap = {
  AccountExportSharedReferenceEntryType.sharedCollectionReference:
      'shared-collection-reference',
  AccountExportSharedReferenceEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportSoftwareGrant
_$AccountExportArchiveEntriesSealedAccountExportSoftwareGrantFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportSoftwareGrant(
  grantId: json['grantId'] as String,
  softwareId: json['softwareId'] as String,
  state: AccountExportSoftwareGrantState.fromJson(json['state'] as String),
  revision: (json['revision'] as num).toInt(),
  recipientKey: json['recipientKey'] as String?,
  entryType: AccountExportSoftwareGrantEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportSoftwareGrantToJson(
  AccountExportArchiveEntriesSealedAccountExportSoftwareGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'softwareId': instance.softwareId,
  'state': _$AccountExportSoftwareGrantStateEnumMap[instance.state]!,
  'revision': instance.revision,
  'recipientKey': instance.recipientKey,
  'entryType':
      _$AccountExportSoftwareGrantEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSoftwareGrantStateEnumMap = {
  AccountExportSoftwareGrantState.active: 'active',
  AccountExportSoftwareGrantState.revoked: 'revoked',
  AccountExportSoftwareGrantState.$unknown: r'$unknown',
};

const _$AccountExportSoftwareGrantEntryTypeEnumMap = {
  AccountExportSoftwareGrantEntryType.softwareGrant: 'software-grant',
  AccountExportSoftwareGrantEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportSoftwareTarget
_$AccountExportArchiveEntriesSealedAccountExportSoftwareTargetFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportSoftwareTarget(
  grantId: json['grantId'] as String,
  resourceKind: AccountExportSoftwareTargetResourceKind.fromJson(
    json['resourceKind'] as String,
  ),
  resourceId: json['resourceId'] as String,
  recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
  entryType: AccountExportSoftwareTargetEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportSoftwareTargetToJson(
  AccountExportArchiveEntriesSealedAccountExportSoftwareTarget instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'resourceKind':
      _$AccountExportSoftwareTargetResourceKindEnumMap[instance.resourceKind]!,
  'resourceId': instance.resourceId,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType':
      _$AccountExportSoftwareTargetEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSoftwareTargetResourceKindEnumMap = {
  AccountExportSoftwareTargetResourceKind.record: 'record',
  AccountExportSoftwareTargetResourceKind.collection: 'collection',
  AccountExportSoftwareTargetResourceKind.$unknown: r'$unknown',
};

const _$AccountExportSoftwareTargetEntryTypeEnumMap = {
  AccountExportSoftwareTargetEntryType.softwareTarget: 'software-target',
  AccountExportSoftwareTargetEntryType.$unknown: r'$unknown',
};

AccountExportArchiveEntriesSealedAccountExportTrashOperation
_$AccountExportArchiveEntriesSealedAccountExportTrashOperationFromJson(
  Map<String, dynamic> json,
) => AccountExportArchiveEntriesSealedAccountExportTrashOperation(
  operationId: json['operationId'] as String,
  rootKind: AccountExportTrashOperationRootKind.fromJson(
    json['rootKind'] as String,
  ),
  rootId: json['rootId'] as String,
  deletedAt: DateTime.parse(json['deletedAt'] as String),
  purgeAt: DateTime.parse(json['purgeAt'] as String),
  entryType: AccountExportTrashOperationEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic>
_$AccountExportArchiveEntriesSealedAccountExportTrashOperationToJson(
  AccountExportArchiveEntriesSealedAccountExportTrashOperation instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'rootKind': _$AccountExportTrashOperationRootKindEnumMap[instance.rootKind]!,
  'rootId': instance.rootId,
  'deletedAt': instance.deletedAt.toIso8601String(),
  'purgeAt': instance.purgeAt.toIso8601String(),
  'entryType':
      _$AccountExportTrashOperationEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportTrashOperationRootKindEnumMap = {
  AccountExportTrashOperationRootKind.profile: 'profile',
  AccountExportTrashOperationRootKind.record: 'record',
  AccountExportTrashOperationRootKind.folder: 'folder',
  AccountExportTrashOperationRootKind.collection: 'collection',
  AccountExportTrashOperationRootKind.$unknown: r'$unknown',
};

const _$AccountExportTrashOperationEntryTypeEnumMap = {
  AccountExportTrashOperationEntryType.trashOperation: 'trash-operation',
  AccountExportTrashOperationEntryType.$unknown: r'$unknown',
};
