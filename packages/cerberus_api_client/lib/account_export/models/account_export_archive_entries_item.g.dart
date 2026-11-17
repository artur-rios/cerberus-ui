// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_archive_entries_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportAccount _$AccountExportAccountFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['details', 'entryType'],
    requiredKeys: const ['details', 'entryType'],
    disallowNullValues: const ['entryType'],
  );
  return AccountExportAccount(
    details: json['details'] as String?,
    entryType: AccountExportAccount._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportAccountToJson(
  AccountExportAccount instance,
) => <String, dynamic>{
  'details': instance.details,
  'entryType': ?AccountExportAccount._write_entryType(instance.entryType),
};

AccountExportProtection _$AccountExportProtectionFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'revision',
      'keyEpoch',
      'recoveryGeneration',
      'material',
      'entryType',
    ],
    requiredKeys: const [
      'revision',
      'keyEpoch',
      'recoveryGeneration',
      'material',
      'entryType',
    ],
    disallowNullValues: const [
      'revision',
      'keyEpoch',
      'recoveryGeneration',
      'entryType',
    ],
  );
  return AccountExportProtection(
    revision: AccountExportProtection._read_revision(json['revision']),
    keyEpoch: AccountExportProtection._read_keyEpoch(json['keyEpoch']),
    recoveryGeneration: AccountExportProtection._read_recoveryGeneration(
      json['recoveryGeneration'],
    ),
    material: json['material'] as String?,
    entryType: AccountExportProtection._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportProtectionToJson(
  AccountExportProtection instance,
) => <String, dynamic>{
  'revision': ?AccountExportProtection._write_revision(instance.revision),
  'keyEpoch': ?AccountExportProtection._write_keyEpoch(instance.keyEpoch),
  'recoveryGeneration': ?AccountExportProtection._write_recoveryGeneration(
    instance.recoveryGeneration,
  ),
  'material': instance.material,
  'entryType': ?AccountExportProtection._write_entryType(instance.entryType),
};

AccountExportProfile _$AccountExportProfileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'keyWrappers',
      'entryType',
    ],
    requiredKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'keyWrappers',
      'entryType',
    ],
    disallowNullValues: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'entryType',
    ],
  );
  return AccountExportProfile(
    resourceId: json['resourceId'] as String,
    revision: AccountExportProfile._read_revision(json['revision']),
    serverSequence: AccountExportProfile._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: AccountExportProfile._read_editedAt(json['editedAt']),
    deletedAt: AccountExportProfile._read_deletedAt(json['deletedAt']),
    purgeAt: AccountExportProfile._read_purgeAt(json['purgeAt']),
    envelope: json['envelope'] as String?,
    keyWrappers: json['keyWrappers'] as String?,
    entryType: AccountExportProfile._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportProfileToJson(
  AccountExportProfile instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': ?AccountExportProfile._write_revision(instance.revision),
  'serverSequence': ?AccountExportProfile._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?AccountExportProfile._write_editedAt(instance.editedAt),
  'deletedAt': AccountExportProfile._write_deletedAt(instance.deletedAt),
  'purgeAt': AccountExportProfile._write_purgeAt(instance.purgeAt),
  'envelope': instance.envelope,
  'keyWrappers': instance.keyWrappers,
  'entryType': ?AccountExportProfile._write_entryType(instance.entryType),
};

AccountExportRecord _$AccountExportRecordFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'folderId',
      'entryType',
    ],
    requiredKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'folderId',
      'entryType',
    ],
    disallowNullValues: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'entryType',
    ],
  );
  return AccountExportRecord(
    resourceId: json['resourceId'] as String,
    revision: AccountExportRecord._read_revision(json['revision']),
    serverSequence: AccountExportRecord._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: AccountExportRecord._read_editedAt(json['editedAt']),
    deletedAt: AccountExportRecord._read_deletedAt(json['deletedAt']),
    purgeAt: AccountExportRecord._read_purgeAt(json['purgeAt']),
    envelope: json['envelope'] as String?,
    folderId: json['folderId'] as String?,
    entryType: AccountExportRecord._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportRecordToJson(
  AccountExportRecord instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': ?AccountExportRecord._write_revision(instance.revision),
  'serverSequence': ?AccountExportRecord._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?AccountExportRecord._write_editedAt(instance.editedAt),
  'deletedAt': AccountExportRecord._write_deletedAt(instance.deletedAt),
  'purgeAt': AccountExportRecord._write_purgeAt(instance.purgeAt),
  'envelope': instance.envelope,
  'folderId': instance.folderId,
  'entryType': ?AccountExportRecord._write_entryType(instance.entryType),
};

AccountExportFolder _$AccountExportFolderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'parentFolderId',
      'entryType',
    ],
    requiredKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'parentFolderId',
      'entryType',
    ],
    disallowNullValues: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'entryType',
    ],
  );
  return AccountExportFolder(
    resourceId: json['resourceId'] as String,
    revision: AccountExportFolder._read_revision(json['revision']),
    serverSequence: AccountExportFolder._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: AccountExportFolder._read_editedAt(json['editedAt']),
    deletedAt: AccountExportFolder._read_deletedAt(json['deletedAt']),
    purgeAt: AccountExportFolder._read_purgeAt(json['purgeAt']),
    envelope: json['envelope'] as String?,
    parentFolderId: json['parentFolderId'] as String?,
    entryType: AccountExportFolder._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportFolderToJson(
  AccountExportFolder instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': ?AccountExportFolder._write_revision(instance.revision),
  'serverSequence': ?AccountExportFolder._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?AccountExportFolder._write_editedAt(instance.editedAt),
  'deletedAt': AccountExportFolder._write_deletedAt(instance.deletedAt),
  'purgeAt': AccountExportFolder._write_purgeAt(instance.purgeAt),
  'envelope': instance.envelope,
  'parentFolderId': instance.parentFolderId,
  'entryType': ?AccountExportFolder._write_entryType(instance.entryType),
};

AccountExportCollection _$AccountExportCollectionFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'keyEpoch',
      'entryType',
    ],
    requiredKeys: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'keyEpoch',
      'entryType',
    ],
    disallowNullValues: const [
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'keyEpoch',
      'entryType',
    ],
  );
  return AccountExportCollection(
    resourceId: json['resourceId'] as String,
    revision: AccountExportCollection._read_revision(json['revision']),
    serverSequence: AccountExportCollection._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: AccountExportCollection._read_editedAt(json['editedAt']),
    deletedAt: AccountExportCollection._read_deletedAt(json['deletedAt']),
    purgeAt: AccountExportCollection._read_purgeAt(json['purgeAt']),
    envelope: json['envelope'] as String?,
    keyEpoch: AccountExportCollection._read_keyEpoch(json['keyEpoch']),
    entryType: AccountExportCollection._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportCollectionToJson(
  AccountExportCollection instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': ?AccountExportCollection._write_revision(instance.revision),
  'serverSequence': ?AccountExportCollection._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?AccountExportCollection._write_editedAt(instance.editedAt),
  'deletedAt': AccountExportCollection._write_deletedAt(instance.deletedAt),
  'purgeAt': AccountExportCollection._write_purgeAt(instance.purgeAt),
  'envelope': instance.envelope,
  'keyEpoch': ?AccountExportCollection._write_keyEpoch(instance.keyEpoch),
  'entryType': ?AccountExportCollection._write_entryType(instance.entryType),
};

AccountExportRelationship _$AccountExportRelationshipFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'relationshipKind',
      'sourceKind',
      'sourceId',
      'targetKind',
      'targetId',
      'operationId',
      'entryType',
    ],
    requiredKeys: const [
      'relationshipKind',
      'sourceKind',
      'sourceId',
      'targetKind',
      'targetId',
      'operationId',
      'entryType',
    ],
    disallowNullValues: const [
      'relationshipKind',
      'sourceKind',
      'sourceId',
      'targetKind',
      'targetId',
      'entryType',
    ],
  );
  return AccountExportRelationship(
    relationshipKind: AccountExportRelationship._read_relationshipKind(
      json['relationshipKind'],
    ),
    sourceKind: AccountExportRelationship._read_sourceKind(json['sourceKind']),
    sourceId: json['sourceId'] as String,
    targetKind: AccountExportRelationship._read_targetKind(json['targetKind']),
    targetId: json['targetId'] as String,
    operationId: json['operationId'] as String?,
    entryType: AccountExportRelationship._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportRelationshipToJson(
  AccountExportRelationship instance,
) => <String, dynamic>{
  'relationshipKind': ?AccountExportRelationship._write_relationshipKind(
    instance.relationshipKind,
  ),
  'sourceKind': ?AccountExportRelationship._write_sourceKind(
    instance.sourceKind,
  ),
  'sourceId': instance.sourceId,
  'targetKind': ?AccountExportRelationship._write_targetKind(
    instance.targetKind,
  ),
  'targetId': instance.targetId,
  'operationId': instance.operationId,
  'entryType': ?AccountExportRelationship._write_entryType(instance.entryType),
};

AccountExportCollectionGrant _$AccountExportCollectionGrantFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'grantId',
      'collectionId',
      'recipientAccountId',
      'access',
      'state',
      'revision',
      'recipientKeyEnvelope',
      'entryType',
    ],
    requiredKeys: const [
      'grantId',
      'collectionId',
      'recipientAccountId',
      'access',
      'state',
      'revision',
      'recipientKeyEnvelope',
      'entryType',
    ],
    disallowNullValues: const [
      'grantId',
      'collectionId',
      'recipientAccountId',
      'access',
      'state',
      'revision',
      'entryType',
    ],
  );
  return AccountExportCollectionGrant(
    grantId: json['grantId'] as String,
    collectionId: json['collectionId'] as String,
    recipientAccountId: json['recipientAccountId'] as String,
    access: AccountExportCollectionGrant._read_access(json['access']),
    state: AccountExportCollectionGrant._read_state(json['state']),
    revision: AccountExportCollectionGrant._read_revision(json['revision']),
    recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
    entryType: AccountExportCollectionGrant._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportCollectionGrantToJson(
  AccountExportCollectionGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'collectionId': instance.collectionId,
  'recipientAccountId': instance.recipientAccountId,
  'access': ?AccountExportCollectionGrant._write_access(instance.access),
  'state': ?AccountExportCollectionGrant._write_state(instance.state),
  'revision': ?AccountExportCollectionGrant._write_revision(instance.revision),
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType': ?AccountExportCollectionGrant._write_entryType(
    instance.entryType,
  ),
};

AccountExportSharedReference _$AccountExportSharedReferenceFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'access',
      'entryType',
    ],
    requiredKeys: const [
      'collectionId',
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'access',
      'entryType',
    ],
    disallowNullValues: const [
      'collectionId',
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'access',
      'entryType',
    ],
  );
  return AccountExportSharedReference(
    collectionId: json['collectionId'] as String,
    ownerAccountId: json['ownerAccountId'] as String,
    grantId: json['grantId'] as String,
    grantRevision: AccountExportSharedReference._read_grantRevision(
      json['grantRevision'],
    ),
    access: AccountExportSharedReference._read_access(json['access']),
    entryType: AccountExportSharedReference._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportSharedReferenceToJson(
  AccountExportSharedReference instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'ownerAccountId': instance.ownerAccountId,
  'grantId': instance.grantId,
  'grantRevision': ?AccountExportSharedReference._write_grantRevision(
    instance.grantRevision,
  ),
  'access': ?AccountExportSharedReference._write_access(instance.access),
  'entryType': ?AccountExportSharedReference._write_entryType(
    instance.entryType,
  ),
};

AccountExportSoftwareGrant _$AccountExportSoftwareGrantFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'grantId',
      'softwareId',
      'state',
      'revision',
      'recipientKey',
      'entryType',
    ],
    requiredKeys: const [
      'grantId',
      'softwareId',
      'state',
      'revision',
      'recipientKey',
      'entryType',
    ],
    disallowNullValues: const [
      'grantId',
      'softwareId',
      'state',
      'revision',
      'entryType',
    ],
  );
  return AccountExportSoftwareGrant(
    grantId: json['grantId'] as String,
    softwareId: json['softwareId'] as String,
    state: AccountExportSoftwareGrant._read_state(json['state']),
    revision: AccountExportSoftwareGrant._read_revision(json['revision']),
    recipientKey: json['recipientKey'] as String?,
    entryType: AccountExportSoftwareGrant._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportSoftwareGrantToJson(
  AccountExportSoftwareGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'softwareId': instance.softwareId,
  'state': ?AccountExportSoftwareGrant._write_state(instance.state),
  'revision': ?AccountExportSoftwareGrant._write_revision(instance.revision),
  'recipientKey': instance.recipientKey,
  'entryType': ?AccountExportSoftwareGrant._write_entryType(instance.entryType),
};

AccountExportSoftwareTarget _$AccountExportSoftwareTargetFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'grantId',
      'resourceKind',
      'resourceId',
      'recipientKeyEnvelope',
      'entryType',
    ],
    requiredKeys: const [
      'grantId',
      'resourceKind',
      'resourceId',
      'recipientKeyEnvelope',
      'entryType',
    ],
    disallowNullValues: const [
      'grantId',
      'resourceKind',
      'resourceId',
      'entryType',
    ],
  );
  return AccountExportSoftwareTarget(
    grantId: json['grantId'] as String,
    resourceKind: AccountExportSoftwareTarget._read_resourceKind(
      json['resourceKind'],
    ),
    resourceId: json['resourceId'] as String,
    recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
    entryType: AccountExportSoftwareTarget._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportSoftwareTargetToJson(
  AccountExportSoftwareTarget instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'resourceKind': ?AccountExportSoftwareTarget._write_resourceKind(
    instance.resourceKind,
  ),
  'resourceId': instance.resourceId,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType': ?AccountExportSoftwareTarget._write_entryType(
    instance.entryType,
  ),
};

AccountExportTrashOperation _$AccountExportTrashOperationFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'rootKind',
      'rootId',
      'deletedAt',
      'purgeAt',
      'entryType',
    ],
    requiredKeys: const [
      'operationId',
      'rootKind',
      'rootId',
      'deletedAt',
      'purgeAt',
      'entryType',
    ],
    disallowNullValues: const [
      'operationId',
      'rootKind',
      'rootId',
      'deletedAt',
      'purgeAt',
      'entryType',
    ],
  );
  return AccountExportTrashOperation(
    operationId: json['operationId'] as String,
    rootKind: AccountExportTrashOperation._read_rootKind(json['rootKind']),
    rootId: json['rootId'] as String,
    deletedAt: AccountExportTrashOperation._read_deletedAt(json['deletedAt']),
    purgeAt: AccountExportTrashOperation._read_purgeAt(json['purgeAt']),
    entryType: AccountExportTrashOperation._read_entryType(json['entryType']),
  );
}

Map<String, dynamic> _$AccountExportTrashOperationToJson(
  AccountExportTrashOperation instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'rootKind': ?AccountExportTrashOperation._write_rootKind(instance.rootKind),
  'rootId': instance.rootId,
  'deletedAt': ?AccountExportTrashOperation._write_deletedAt(
    instance.deletedAt,
  ),
  'purgeAt': ?AccountExportTrashOperation._write_purgeAt(instance.purgeAt),
  'entryType': ?AccountExportTrashOperation._write_entryType(
    instance.entryType,
  ),
};
