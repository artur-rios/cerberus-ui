// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_store.dart';

// ignore_for_file: type=lint
class $StoredEntitiesTable extends StoredEntities
    with TableInfo<$StoredEntitiesTable, StoredEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoredEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _publicIdMeta = const VerificationMeta(
    'publicId',
  );
  @override
  late final GeneratedColumn<String> publicId = GeneratedColumn<String>(
    'public_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntityKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<EntityKind>($StoredEntitiesTable.$converterkind);
  static const VerificationMeta _envelopeMeta = const VerificationMeta(
    'envelope',
  );
  @override
  late final GeneratedColumn<String> envelope = GeneratedColumn<String>(
    'envelope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pendingMeta = const VerificationMeta(
    'pending',
  );
  @override
  late final GeneratedColumn<bool> pending = GeneratedColumn<bool>(
    'pending',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pending" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    publicId,
    kind,
    envelope,
    metadata,
    pending,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stored_entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('public_id')) {
      context.handle(
        _publicIdMeta,
        publicId.isAcceptableOrUnknown(data['public_id']!, _publicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_publicIdMeta);
    }
    if (data.containsKey('envelope')) {
      context.handle(
        _envelopeMeta,
        envelope.isAcceptableOrUnknown(data['envelope']!, _envelopeMeta),
      );
    } else if (isInserting) {
      context.missing(_envelopeMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    } else if (isInserting) {
      context.missing(_metadataMeta);
    }
    if (data.containsKey('pending')) {
      context.handle(
        _pendingMeta,
        pending.isAcceptableOrUnknown(data['pending']!, _pendingMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {publicId};
  @override
  StoredEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredEntity(
      publicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_id'],
      )!,
      kind: $StoredEntitiesTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      envelope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}envelope'],
      )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      )!,
      pending: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pending'],
      )!,
    );
  }

  @override
  $StoredEntitiesTable createAlias(String alias) {
    return $StoredEntitiesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntityKind, String, String> $converterkind =
      const EnumNameConverter<EntityKind>(EntityKind.values);
}

class StoredEntity extends DataClass implements Insertable<StoredEntity> {
  /// The API's public identifier, or one generated offline for a creation.
  final String publicId;
  final EntityKind kind;

  /// The encrypted envelope, as the API's JSON. Never plaintext.
  final String envelope;

  /// Server-visible metadata, as JSON: parent folder, memberships,
  /// associations, revision, edit time, sequence.
  final String metadata;

  /// Whether a local edit to this entity has not been uploaded yet.
  final bool pending;
  const StoredEntity({
    required this.publicId,
    required this.kind,
    required this.envelope,
    required this.metadata,
    required this.pending,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['public_id'] = Variable<String>(publicId);
    {
      map['kind'] = Variable<String>(
        $StoredEntitiesTable.$converterkind.toSql(kind),
      );
    }
    map['envelope'] = Variable<String>(envelope);
    map['metadata'] = Variable<String>(metadata);
    map['pending'] = Variable<bool>(pending);
    return map;
  }

  StoredEntitiesCompanion toCompanion(bool nullToAbsent) {
    return StoredEntitiesCompanion(
      publicId: Value(publicId),
      kind: Value(kind),
      envelope: Value(envelope),
      metadata: Value(metadata),
      pending: Value(pending),
    );
  }

  factory StoredEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredEntity(
      publicId: serializer.fromJson<String>(json['publicId']),
      kind: $StoredEntitiesTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      envelope: serializer.fromJson<String>(json['envelope']),
      metadata: serializer.fromJson<String>(json['metadata']),
      pending: serializer.fromJson<bool>(json['pending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'publicId': serializer.toJson<String>(publicId),
      'kind': serializer.toJson<String>(
        $StoredEntitiesTable.$converterkind.toJson(kind),
      ),
      'envelope': serializer.toJson<String>(envelope),
      'metadata': serializer.toJson<String>(metadata),
      'pending': serializer.toJson<bool>(pending),
    };
  }

  StoredEntity copyWith({
    String? publicId,
    EntityKind? kind,
    String? envelope,
    String? metadata,
    bool? pending,
  }) => StoredEntity(
    publicId: publicId ?? this.publicId,
    kind: kind ?? this.kind,
    envelope: envelope ?? this.envelope,
    metadata: metadata ?? this.metadata,
    pending: pending ?? this.pending,
  );
  StoredEntity copyWithCompanion(StoredEntitiesCompanion data) {
    return StoredEntity(
      publicId: data.publicId.present ? data.publicId.value : this.publicId,
      kind: data.kind.present ? data.kind.value : this.kind,
      envelope: data.envelope.present ? data.envelope.value : this.envelope,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      pending: data.pending.present ? data.pending.value : this.pending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredEntity(')
          ..write('publicId: $publicId, ')
          ..write('kind: $kind, ')
          ..write('envelope: $envelope, ')
          ..write('metadata: $metadata, ')
          ..write('pending: $pending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(publicId, kind, envelope, metadata, pending);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredEntity &&
          other.publicId == this.publicId &&
          other.kind == this.kind &&
          other.envelope == this.envelope &&
          other.metadata == this.metadata &&
          other.pending == this.pending);
}

class StoredEntitiesCompanion extends UpdateCompanion<StoredEntity> {
  final Value<String> publicId;
  final Value<EntityKind> kind;
  final Value<String> envelope;
  final Value<String> metadata;
  final Value<bool> pending;
  final Value<int> rowid;
  const StoredEntitiesCompanion({
    this.publicId = const Value.absent(),
    this.kind = const Value.absent(),
    this.envelope = const Value.absent(),
    this.metadata = const Value.absent(),
    this.pending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoredEntitiesCompanion.insert({
    required String publicId,
    required EntityKind kind,
    required String envelope,
    required String metadata,
    this.pending = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : publicId = Value(publicId),
       kind = Value(kind),
       envelope = Value(envelope),
       metadata = Value(metadata);
  static Insertable<StoredEntity> custom({
    Expression<String>? publicId,
    Expression<String>? kind,
    Expression<String>? envelope,
    Expression<String>? metadata,
    Expression<bool>? pending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (publicId != null) 'public_id': publicId,
      if (kind != null) 'kind': kind,
      if (envelope != null) 'envelope': envelope,
      if (metadata != null) 'metadata': metadata,
      if (pending != null) 'pending': pending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoredEntitiesCompanion copyWith({
    Value<String>? publicId,
    Value<EntityKind>? kind,
    Value<String>? envelope,
    Value<String>? metadata,
    Value<bool>? pending,
    Value<int>? rowid,
  }) {
    return StoredEntitiesCompanion(
      publicId: publicId ?? this.publicId,
      kind: kind ?? this.kind,
      envelope: envelope ?? this.envelope,
      metadata: metadata ?? this.metadata,
      pending: pending ?? this.pending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (publicId.present) {
      map['public_id'] = Variable<String>(publicId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $StoredEntitiesTable.$converterkind.toSql(kind.value),
      );
    }
    if (envelope.present) {
      map['envelope'] = Variable<String>(envelope.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (pending.present) {
      map['pending'] = Variable<bool>(pending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoredEntitiesCompanion(')
          ..write('publicId: $publicId, ')
          ..write('kind: $kind, ')
          ..write('envelope: $envelope, ')
          ..write('metadata: $metadata, ')
          ..write('pending: $pending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineLeasesTable extends OfflineLeases
    with TableInfo<$OfflineLeasesTable, OfflineLease> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineLeasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    check: () => id.equals(1),
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latestObservedTimeMeta =
      const VerificationMeta('latestObservedTime');
  @override
  late final GeneratedColumn<DateTime> latestObservedTime =
      GeneratedColumn<DateTime>(
        'latest_observed_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    token,
    scope,
    expiresAt,
    latestObservedTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_leases';
  @override
  VerificationContext validateIntegrity(
    Insertable<OfflineLease> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('latest_observed_time')) {
      context.handle(
        _latestObservedTimeMeta,
        latestObservedTime.isAcceptableOrUnknown(
          data['latest_observed_time']!,
          _latestObservedTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_latestObservedTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflineLease map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineLease(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      latestObservedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}latest_observed_time'],
      )!,
    );
  }

  @override
  $OfflineLeasesTable createAlias(String alias) {
    return $OfflineLeasesTable(attachedDatabase, alias);
  }
}

class OfflineLease extends DataClass implements Insertable<OfflineLease> {
  /// Always 1: there is only ever one lease, replaced on renewal. A lone
  /// integer primary key is SQLite's rowid, which ignores a default, so the
  /// check is what refuses a second row.
  final int id;

  /// The ES256 JWS, verified before use (`FR-CR-09`).
  final String token;

  /// The profile and grant identifiers the lease covers, as JSON.
  final String scope;

  /// When the lease expires; `null` only when renewal is disabled.
  final DateTime? expiresAt;

  /// The latest time this device has observed — the clock-rollback guard.
  final DateTime latestObservedTime;
  const OfflineLease({
    required this.id,
    required this.token,
    required this.scope,
    this.expiresAt,
    required this.latestObservedTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['token'] = Variable<String>(token);
    map['scope'] = Variable<String>(scope);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['latest_observed_time'] = Variable<DateTime>(latestObservedTime);
    return map;
  }

  OfflineLeasesCompanion toCompanion(bool nullToAbsent) {
    return OfflineLeasesCompanion(
      id: Value(id),
      token: Value(token),
      scope: Value(scope),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      latestObservedTime: Value(latestObservedTime),
    );
  }

  factory OfflineLease.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineLease(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      scope: serializer.fromJson<String>(json['scope']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      latestObservedTime: serializer.fromJson<DateTime>(
        json['latestObservedTime'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'scope': serializer.toJson<String>(scope),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'latestObservedTime': serializer.toJson<DateTime>(latestObservedTime),
    };
  }

  OfflineLease copyWith({
    int? id,
    String? token,
    String? scope,
    Value<DateTime?> expiresAt = const Value.absent(),
    DateTime? latestObservedTime,
  }) => OfflineLease(
    id: id ?? this.id,
    token: token ?? this.token,
    scope: scope ?? this.scope,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    latestObservedTime: latestObservedTime ?? this.latestObservedTime,
  );
  OfflineLease copyWithCompanion(OfflineLeasesCompanion data) {
    return OfflineLease(
      id: data.id.present ? data.id.value : this.id,
      token: data.token.present ? data.token.value : this.token,
      scope: data.scope.present ? data.scope.value : this.scope,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      latestObservedTime: data.latestObservedTime.present
          ? data.latestObservedTime.value
          : this.latestObservedTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineLease(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('scope: $scope, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('latestObservedTime: $latestObservedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, token, scope, expiresAt, latestObservedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineLease &&
          other.id == this.id &&
          other.token == this.token &&
          other.scope == this.scope &&
          other.expiresAt == this.expiresAt &&
          other.latestObservedTime == this.latestObservedTime);
}

class OfflineLeasesCompanion extends UpdateCompanion<OfflineLease> {
  final Value<int> id;
  final Value<String> token;
  final Value<String> scope;
  final Value<DateTime?> expiresAt;
  final Value<DateTime> latestObservedTime;
  const OfflineLeasesCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.scope = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.latestObservedTime = const Value.absent(),
  });
  OfflineLeasesCompanion.insert({
    this.id = const Value.absent(),
    required String token,
    required String scope,
    this.expiresAt = const Value.absent(),
    required DateTime latestObservedTime,
  }) : token = Value(token),
       scope = Value(scope),
       latestObservedTime = Value(latestObservedTime);
  static Insertable<OfflineLease> custom({
    Expression<int>? id,
    Expression<String>? token,
    Expression<String>? scope,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? latestObservedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (scope != null) 'scope': scope,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (latestObservedTime != null)
        'latest_observed_time': latestObservedTime,
    });
  }

  OfflineLeasesCompanion copyWith({
    Value<int>? id,
    Value<String>? token,
    Value<String>? scope,
    Value<DateTime?>? expiresAt,
    Value<DateTime>? latestObservedTime,
  }) {
    return OfflineLeasesCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      scope: scope ?? this.scope,
      expiresAt: expiresAt ?? this.expiresAt,
      latestObservedTime: latestObservedTime ?? this.latestObservedTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (latestObservedTime.present) {
      map['latest_observed_time'] = Variable<DateTime>(
        latestObservedTime.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineLeasesCompanion(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('scope: $scope, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('latestObservedTime: $latestObservedTime')
          ..write(')'))
        .toString();
  }
}

class $SyncCursorsTable extends SyncCursors
    with TableInfo<$SyncCursorsTable, SyncCursor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncCursorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    check: () => id.equals(1),
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cursorMeta = const VerificationMeta('cursor');
  @override
  late final GeneratedColumn<String> cursor = GeneratedColumn<String>(
    'cursor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, cursor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_cursors';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncCursor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cursor')) {
      context.handle(
        _cursorMeta,
        cursor.isAcceptableOrUnknown(data['cursor']!, _cursorMeta),
      );
    } else if (isInserting) {
      context.missing(_cursorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncCursor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncCursor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cursor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cursor'],
      )!,
    );
  }

  @override
  $SyncCursorsTable createAlias(String alias) {
    return $SyncCursorsTable(attachedDatabase, alias);
  }
}

class SyncCursor extends DataClass implements Insertable<SyncCursor> {
  /// Always 1: there is only ever one cursor, replaced as it advances. A lone
  /// integer primary key is SQLite's rowid, which ignores a default, so the
  /// check is what refuses a second row.
  final int id;

  /// The API's opaque change cursor.
  final String cursor;
  const SyncCursor({required this.id, required this.cursor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cursor'] = Variable<String>(cursor);
    return map;
  }

  SyncCursorsCompanion toCompanion(bool nullToAbsent) {
    return SyncCursorsCompanion(id: Value(id), cursor: Value(cursor));
  }

  factory SyncCursor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncCursor(
      id: serializer.fromJson<int>(json['id']),
      cursor: serializer.fromJson<String>(json['cursor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cursor': serializer.toJson<String>(cursor),
    };
  }

  SyncCursor copyWith({int? id, String? cursor}) =>
      SyncCursor(id: id ?? this.id, cursor: cursor ?? this.cursor);
  SyncCursor copyWithCompanion(SyncCursorsCompanion data) {
    return SyncCursor(
      id: data.id.present ? data.id.value : this.id,
      cursor: data.cursor.present ? data.cursor.value : this.cursor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursor(')
          ..write('id: $id, ')
          ..write('cursor: $cursor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cursor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncCursor &&
          other.id == this.id &&
          other.cursor == this.cursor);
}

class SyncCursorsCompanion extends UpdateCompanion<SyncCursor> {
  final Value<int> id;
  final Value<String> cursor;
  const SyncCursorsCompanion({
    this.id = const Value.absent(),
    this.cursor = const Value.absent(),
  });
  SyncCursorsCompanion.insert({
    this.id = const Value.absent(),
    required String cursor,
  }) : cursor = Value(cursor);
  static Insertable<SyncCursor> custom({
    Expression<int>? id,
    Expression<String>? cursor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cursor != null) 'cursor': cursor,
    });
  }

  SyncCursorsCompanion copyWith({Value<int>? id, Value<String>? cursor}) {
    return SyncCursorsCompanion(
      id: id ?? this.id,
      cursor: cursor ?? this.cursor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cursor.present) {
      map['cursor'] = Variable<String>(cursor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursorsCompanion(')
          ..write('id: $id, ')
          ..write('cursor: $cursor')
          ..write(')'))
        .toString();
  }
}

class $PendingEditsTable extends PendingEdits
    with TableInfo<$PendingEditsTable, PendingEdit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingEditsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityPublicIdMeta = const VerificationMeta(
    'entityPublicId',
  );
  @override
  late final GeneratedColumn<String> entityPublicId = GeneratedColumn<String>(
    'entity_public_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EditKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<EditKind>($PendingEditsTable.$converterkind);
  static const VerificationMeta _envelopeMeta = const VerificationMeta(
    'envelope',
  );
  @override
  late final GeneratedColumn<String> envelope = GeneratedColumn<String>(
    'envelope',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _editedAtMeta = const VerificationMeta(
    'editedAt',
  );
  @override
  late final GeneratedColumn<DateTime> editedAt = GeneratedColumn<DateTime>(
    'edited_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    operationId,
    entityPublicId,
    kind,
    envelope,
    editedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_edits';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingEdit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('entity_public_id')) {
      context.handle(
        _entityPublicIdMeta,
        entityPublicId.isAcceptableOrUnknown(
          data['entity_public_id']!,
          _entityPublicIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entityPublicIdMeta);
    }
    if (data.containsKey('envelope')) {
      context.handle(
        _envelopeMeta,
        envelope.isAcceptableOrUnknown(data['envelope']!, _envelopeMeta),
      );
    }
    if (data.containsKey('edited_at')) {
      context.handle(
        _editedAtMeta,
        editedAt.isAcceptableOrUnknown(data['edited_at']!, _editedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_editedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operationId};
  @override
  PendingEdit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingEdit(
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      entityPublicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_public_id'],
      )!,
      kind: $PendingEditsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      envelope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}envelope'],
      ),
      editedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}edited_at'],
      )!,
    );
  }

  @override
  $PendingEditsTable createAlias(String alias) {
    return $PendingEditsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EditKind, String, String> $converterkind =
      const EnumNameConverter<EditKind>(EditKind.values);
}

class PendingEdit extends DataClass implements Insertable<PendingEdit> {
  /// Makes the upload idempotent.
  final String operationId;

  /// The entity edited — generated on the device for a creation.
  final String entityPublicId;
  final EditKind kind;

  /// The encrypted envelope, for a content change. Never plaintext.
  final String? envelope;

  /// When the edit was made, in UTC — the latest-edit comparison input.
  final DateTime editedAt;
  const PendingEdit({
    required this.operationId,
    required this.entityPublicId,
    required this.kind,
    this.envelope,
    required this.editedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['operation_id'] = Variable<String>(operationId);
    map['entity_public_id'] = Variable<String>(entityPublicId);
    {
      map['kind'] = Variable<String>(
        $PendingEditsTable.$converterkind.toSql(kind),
      );
    }
    if (!nullToAbsent || envelope != null) {
      map['envelope'] = Variable<String>(envelope);
    }
    map['edited_at'] = Variable<DateTime>(editedAt);
    return map;
  }

  PendingEditsCompanion toCompanion(bool nullToAbsent) {
    return PendingEditsCompanion(
      operationId: Value(operationId),
      entityPublicId: Value(entityPublicId),
      kind: Value(kind),
      envelope: envelope == null && nullToAbsent
          ? const Value.absent()
          : Value(envelope),
      editedAt: Value(editedAt),
    );
  }

  factory PendingEdit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingEdit(
      operationId: serializer.fromJson<String>(json['operationId']),
      entityPublicId: serializer.fromJson<String>(json['entityPublicId']),
      kind: $PendingEditsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      envelope: serializer.fromJson<String?>(json['envelope']),
      editedAt: serializer.fromJson<DateTime>(json['editedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'operationId': serializer.toJson<String>(operationId),
      'entityPublicId': serializer.toJson<String>(entityPublicId),
      'kind': serializer.toJson<String>(
        $PendingEditsTable.$converterkind.toJson(kind),
      ),
      'envelope': serializer.toJson<String?>(envelope),
      'editedAt': serializer.toJson<DateTime>(editedAt),
    };
  }

  PendingEdit copyWith({
    String? operationId,
    String? entityPublicId,
    EditKind? kind,
    Value<String?> envelope = const Value.absent(),
    DateTime? editedAt,
  }) => PendingEdit(
    operationId: operationId ?? this.operationId,
    entityPublicId: entityPublicId ?? this.entityPublicId,
    kind: kind ?? this.kind,
    envelope: envelope.present ? envelope.value : this.envelope,
    editedAt: editedAt ?? this.editedAt,
  );
  PendingEdit copyWithCompanion(PendingEditsCompanion data) {
    return PendingEdit(
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      entityPublicId: data.entityPublicId.present
          ? data.entityPublicId.value
          : this.entityPublicId,
      kind: data.kind.present ? data.kind.value : this.kind,
      envelope: data.envelope.present ? data.envelope.value : this.envelope,
      editedAt: data.editedAt.present ? data.editedAt.value : this.editedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingEdit(')
          ..write('operationId: $operationId, ')
          ..write('entityPublicId: $entityPublicId, ')
          ..write('kind: $kind, ')
          ..write('envelope: $envelope, ')
          ..write('editedAt: $editedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(operationId, entityPublicId, kind, envelope, editedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingEdit &&
          other.operationId == this.operationId &&
          other.entityPublicId == this.entityPublicId &&
          other.kind == this.kind &&
          other.envelope == this.envelope &&
          other.editedAt == this.editedAt);
}

class PendingEditsCompanion extends UpdateCompanion<PendingEdit> {
  final Value<String> operationId;
  final Value<String> entityPublicId;
  final Value<EditKind> kind;
  final Value<String?> envelope;
  final Value<DateTime> editedAt;
  final Value<int> rowid;
  const PendingEditsCompanion({
    this.operationId = const Value.absent(),
    this.entityPublicId = const Value.absent(),
    this.kind = const Value.absent(),
    this.envelope = const Value.absent(),
    this.editedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingEditsCompanion.insert({
    required String operationId,
    required String entityPublicId,
    required EditKind kind,
    this.envelope = const Value.absent(),
    required DateTime editedAt,
    this.rowid = const Value.absent(),
  }) : operationId = Value(operationId),
       entityPublicId = Value(entityPublicId),
       kind = Value(kind),
       editedAt = Value(editedAt);
  static Insertable<PendingEdit> custom({
    Expression<String>? operationId,
    Expression<String>? entityPublicId,
    Expression<String>? kind,
    Expression<String>? envelope,
    Expression<DateTime>? editedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (operationId != null) 'operation_id': operationId,
      if (entityPublicId != null) 'entity_public_id': entityPublicId,
      if (kind != null) 'kind': kind,
      if (envelope != null) 'envelope': envelope,
      if (editedAt != null) 'edited_at': editedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingEditsCompanion copyWith({
    Value<String>? operationId,
    Value<String>? entityPublicId,
    Value<EditKind>? kind,
    Value<String?>? envelope,
    Value<DateTime>? editedAt,
    Value<int>? rowid,
  }) {
    return PendingEditsCompanion(
      operationId: operationId ?? this.operationId,
      entityPublicId: entityPublicId ?? this.entityPublicId,
      kind: kind ?? this.kind,
      envelope: envelope ?? this.envelope,
      editedAt: editedAt ?? this.editedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (entityPublicId.present) {
      map['entity_public_id'] = Variable<String>(entityPublicId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $PendingEditsTable.$converterkind.toSql(kind.value),
      );
    }
    if (envelope.present) {
      map['envelope'] = Variable<String>(envelope.value);
    }
    if (editedAt.present) {
      map['edited_at'] = Variable<DateTime>(editedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingEditsCompanion(')
          ..write('operationId: $operationId, ')
          ..write('entityPublicId: $entityPublicId, ')
          ..write('kind: $kind, ')
          ..write('envelope: $envelope, ')
          ..write('editedAt: $editedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalStore extends GeneratedDatabase {
  _$LocalStore(QueryExecutor e) : super(e);
  $LocalStoreManager get managers => $LocalStoreManager(this);
  late final $StoredEntitiesTable storedEntities = $StoredEntitiesTable(this);
  late final $OfflineLeasesTable offlineLeases = $OfflineLeasesTable(this);
  late final $SyncCursorsTable syncCursors = $SyncCursorsTable(this);
  late final $PendingEditsTable pendingEdits = $PendingEditsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    storedEntities,
    offlineLeases,
    syncCursors,
    pendingEdits,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$StoredEntitiesTableCreateCompanionBuilder =
    StoredEntitiesCompanion Function({
      required String publicId,
      required EntityKind kind,
      required String envelope,
      required String metadata,
      Value<bool> pending,
      Value<int> rowid,
    });
typedef $$StoredEntitiesTableUpdateCompanionBuilder =
    StoredEntitiesCompanion Function({
      Value<String> publicId,
      Value<EntityKind> kind,
      Value<String> envelope,
      Value<String> metadata,
      Value<bool> pending,
      Value<int> rowid,
    });

class $$StoredEntitiesTableFilterComposer
    extends Composer<_$LocalStore, $StoredEntitiesTable> {
  $$StoredEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get publicId => $composableBuilder(
    column: $table.publicId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntityKind, EntityKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get envelope => $composableBuilder(
    column: $table.envelope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pending => $composableBuilder(
    column: $table.pending,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StoredEntitiesTableOrderingComposer
    extends Composer<_$LocalStore, $StoredEntitiesTable> {
  $$StoredEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get publicId => $composableBuilder(
    column: $table.publicId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get envelope => $composableBuilder(
    column: $table.envelope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pending => $composableBuilder(
    column: $table.pending,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoredEntitiesTableAnnotationComposer
    extends Composer<_$LocalStore, $StoredEntitiesTable> {
  $$StoredEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get publicId =>
      $composableBuilder(column: $table.publicId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntityKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get envelope =>
      $composableBuilder(column: $table.envelope, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<bool> get pending =>
      $composableBuilder(column: $table.pending, builder: (column) => column);
}

class $$StoredEntitiesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $StoredEntitiesTable,
          StoredEntity,
          $$StoredEntitiesTableFilterComposer,
          $$StoredEntitiesTableOrderingComposer,
          $$StoredEntitiesTableAnnotationComposer,
          $$StoredEntitiesTableCreateCompanionBuilder,
          $$StoredEntitiesTableUpdateCompanionBuilder,
          (
            StoredEntity,
            BaseReferences<_$LocalStore, $StoredEntitiesTable, StoredEntity>,
          ),
          StoredEntity,
          PrefetchHooks Function()
        > {
  $$StoredEntitiesTableTableManager(_$LocalStore db, $StoredEntitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoredEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoredEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoredEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> publicId = const Value.absent(),
                Value<EntityKind> kind = const Value.absent(),
                Value<String> envelope = const Value.absent(),
                Value<String> metadata = const Value.absent(),
                Value<bool> pending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoredEntitiesCompanion(
                publicId: publicId,
                kind: kind,
                envelope: envelope,
                metadata: metadata,
                pending: pending,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String publicId,
                required EntityKind kind,
                required String envelope,
                required String metadata,
                Value<bool> pending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoredEntitiesCompanion.insert(
                publicId: publicId,
                kind: kind,
                envelope: envelope,
                metadata: metadata,
                pending: pending,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StoredEntitiesTable, StoredEntity>(table),
                  BaseReferences<
                    _$LocalStore,
                    $StoredEntitiesTable,
                    StoredEntity
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StoredEntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $StoredEntitiesTable,
      StoredEntity,
      $$StoredEntitiesTableFilterComposer,
      $$StoredEntitiesTableOrderingComposer,
      $$StoredEntitiesTableAnnotationComposer,
      $$StoredEntitiesTableCreateCompanionBuilder,
      $$StoredEntitiesTableUpdateCompanionBuilder,
      (
        StoredEntity,
        BaseReferences<_$LocalStore, $StoredEntitiesTable, StoredEntity>,
      ),
      StoredEntity,
      PrefetchHooks Function()
    >;
typedef $$OfflineLeasesTableCreateCompanionBuilder =
    OfflineLeasesCompanion Function({
      Value<int> id,
      required String token,
      required String scope,
      Value<DateTime?> expiresAt,
      required DateTime latestObservedTime,
    });
typedef $$OfflineLeasesTableUpdateCompanionBuilder =
    OfflineLeasesCompanion Function({
      Value<int> id,
      Value<String> token,
      Value<String> scope,
      Value<DateTime?> expiresAt,
      Value<DateTime> latestObservedTime,
    });

class $$OfflineLeasesTableFilterComposer
    extends Composer<_$LocalStore, $OfflineLeasesTable> {
  $$OfflineLeasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get latestObservedTime => $composableBuilder(
    column: $table.latestObservedTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OfflineLeasesTableOrderingComposer
    extends Composer<_$LocalStore, $OfflineLeasesTable> {
  $$OfflineLeasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get latestObservedTime => $composableBuilder(
    column: $table.latestObservedTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OfflineLeasesTableAnnotationComposer
    extends Composer<_$LocalStore, $OfflineLeasesTable> {
  $$OfflineLeasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get latestObservedTime => $composableBuilder(
    column: $table.latestObservedTime,
    builder: (column) => column,
  );
}

class $$OfflineLeasesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $OfflineLeasesTable,
          OfflineLease,
          $$OfflineLeasesTableFilterComposer,
          $$OfflineLeasesTableOrderingComposer,
          $$OfflineLeasesTableAnnotationComposer,
          $$OfflineLeasesTableCreateCompanionBuilder,
          $$OfflineLeasesTableUpdateCompanionBuilder,
          (
            OfflineLease,
            BaseReferences<_$LocalStore, $OfflineLeasesTable, OfflineLease>,
          ),
          OfflineLease,
          PrefetchHooks Function()
        > {
  $$OfflineLeasesTableTableManager(_$LocalStore db, $OfflineLeasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineLeasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineLeasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineLeasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<DateTime> latestObservedTime = const Value.absent(),
              }) => OfflineLeasesCompanion(
                id: id,
                token: token,
                scope: scope,
                expiresAt: expiresAt,
                latestObservedTime: latestObservedTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String token,
                required String scope,
                Value<DateTime?> expiresAt = const Value.absent(),
                required DateTime latestObservedTime,
              }) => OfflineLeasesCompanion.insert(
                id: id,
                token: token,
                scope: scope,
                expiresAt: expiresAt,
                latestObservedTime: latestObservedTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OfflineLeasesTable, OfflineLease>(table),
                  BaseReferences<
                    _$LocalStore,
                    $OfflineLeasesTable,
                    OfflineLease
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OfflineLeasesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $OfflineLeasesTable,
      OfflineLease,
      $$OfflineLeasesTableFilterComposer,
      $$OfflineLeasesTableOrderingComposer,
      $$OfflineLeasesTableAnnotationComposer,
      $$OfflineLeasesTableCreateCompanionBuilder,
      $$OfflineLeasesTableUpdateCompanionBuilder,
      (
        OfflineLease,
        BaseReferences<_$LocalStore, $OfflineLeasesTable, OfflineLease>,
      ),
      OfflineLease,
      PrefetchHooks Function()
    >;
typedef $$SyncCursorsTableCreateCompanionBuilder =
    SyncCursorsCompanion Function({Value<int> id, required String cursor});
typedef $$SyncCursorsTableUpdateCompanionBuilder =
    SyncCursorsCompanion Function({Value<int> id, Value<String> cursor});

class $$SyncCursorsTableFilterComposer
    extends Composer<_$LocalStore, $SyncCursorsTable> {
  $$SyncCursorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cursor => $composableBuilder(
    column: $table.cursor,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncCursorsTableOrderingComposer
    extends Composer<_$LocalStore, $SyncCursorsTable> {
  $$SyncCursorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cursor => $composableBuilder(
    column: $table.cursor,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncCursorsTableAnnotationComposer
    extends Composer<_$LocalStore, $SyncCursorsTable> {
  $$SyncCursorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cursor =>
      $composableBuilder(column: $table.cursor, builder: (column) => column);
}

class $$SyncCursorsTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $SyncCursorsTable,
          SyncCursor,
          $$SyncCursorsTableFilterComposer,
          $$SyncCursorsTableOrderingComposer,
          $$SyncCursorsTableAnnotationComposer,
          $$SyncCursorsTableCreateCompanionBuilder,
          $$SyncCursorsTableUpdateCompanionBuilder,
          (
            SyncCursor,
            BaseReferences<_$LocalStore, $SyncCursorsTable, SyncCursor>,
          ),
          SyncCursor,
          PrefetchHooks Function()
        > {
  $$SyncCursorsTableTableManager(_$LocalStore db, $SyncCursorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncCursorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncCursorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncCursorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cursor = const Value.absent(),
          }) => SyncCursorsCompanion(id: id, cursor: cursor),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cursor,
          }) => SyncCursorsCompanion.insert(id: id, cursor: cursor),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncCursorsTable, SyncCursor>(table),
                  BaseReferences<_$LocalStore, $SyncCursorsTable, SyncCursor>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncCursorsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $SyncCursorsTable,
      SyncCursor,
      $$SyncCursorsTableFilterComposer,
      $$SyncCursorsTableOrderingComposer,
      $$SyncCursorsTableAnnotationComposer,
      $$SyncCursorsTableCreateCompanionBuilder,
      $$SyncCursorsTableUpdateCompanionBuilder,
      (SyncCursor, BaseReferences<_$LocalStore, $SyncCursorsTable, SyncCursor>),
      SyncCursor,
      PrefetchHooks Function()
    >;
typedef $$PendingEditsTableCreateCompanionBuilder =
    PendingEditsCompanion Function({
      required String operationId,
      required String entityPublicId,
      required EditKind kind,
      Value<String?> envelope,
      required DateTime editedAt,
      Value<int> rowid,
    });
typedef $$PendingEditsTableUpdateCompanionBuilder =
    PendingEditsCompanion Function({
      Value<String> operationId,
      Value<String> entityPublicId,
      Value<EditKind> kind,
      Value<String?> envelope,
      Value<DateTime> editedAt,
      Value<int> rowid,
    });

class $$PendingEditsTableFilterComposer
    extends Composer<_$LocalStore, $PendingEditsTable> {
  $$PendingEditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityPublicId => $composableBuilder(
    column: $table.entityPublicId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EditKind, EditKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get envelope => $composableBuilder(
    column: $table.envelope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get editedAt => $composableBuilder(
    column: $table.editedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingEditsTableOrderingComposer
    extends Composer<_$LocalStore, $PendingEditsTable> {
  $$PendingEditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityPublicId => $composableBuilder(
    column: $table.entityPublicId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get envelope => $composableBuilder(
    column: $table.envelope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get editedAt => $composableBuilder(
    column: $table.editedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingEditsTableAnnotationComposer
    extends Composer<_$LocalStore, $PendingEditsTable> {
  $$PendingEditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityPublicId => $composableBuilder(
    column: $table.entityPublicId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<EditKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get envelope =>
      $composableBuilder(column: $table.envelope, builder: (column) => column);

  GeneratedColumn<DateTime> get editedAt =>
      $composableBuilder(column: $table.editedAt, builder: (column) => column);
}

class $$PendingEditsTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $PendingEditsTable,
          PendingEdit,
          $$PendingEditsTableFilterComposer,
          $$PendingEditsTableOrderingComposer,
          $$PendingEditsTableAnnotationComposer,
          $$PendingEditsTableCreateCompanionBuilder,
          $$PendingEditsTableUpdateCompanionBuilder,
          (
            PendingEdit,
            BaseReferences<_$LocalStore, $PendingEditsTable, PendingEdit>,
          ),
          PendingEdit,
          PrefetchHooks Function()
        > {
  $$PendingEditsTableTableManager(_$LocalStore db, $PendingEditsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingEditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingEditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingEditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> operationId = const Value.absent(),
                Value<String> entityPublicId = const Value.absent(),
                Value<EditKind> kind = const Value.absent(),
                Value<String?> envelope = const Value.absent(),
                Value<DateTime> editedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingEditsCompanion(
                operationId: operationId,
                entityPublicId: entityPublicId,
                kind: kind,
                envelope: envelope,
                editedAt: editedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String operationId,
                required String entityPublicId,
                required EditKind kind,
                Value<String?> envelope = const Value.absent(),
                required DateTime editedAt,
                Value<int> rowid = const Value.absent(),
              }) => PendingEditsCompanion.insert(
                operationId: operationId,
                entityPublicId: entityPublicId,
                kind: kind,
                envelope: envelope,
                editedAt: editedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PendingEditsTable, PendingEdit>(table),
                  BaseReferences<_$LocalStore, $PendingEditsTable, PendingEdit>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingEditsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $PendingEditsTable,
      PendingEdit,
      $$PendingEditsTableFilterComposer,
      $$PendingEditsTableOrderingComposer,
      $$PendingEditsTableAnnotationComposer,
      $$PendingEditsTableCreateCompanionBuilder,
      $$PendingEditsTableUpdateCompanionBuilder,
      (
        PendingEdit,
        BaseReferences<_$LocalStore, $PendingEditsTable, PendingEdit>,
      ),
      PendingEdit,
      PrefetchHooks Function()
    >;

class $LocalStoreManager {
  final _$LocalStore _db;
  $LocalStoreManager(this._db);
  $$StoredEntitiesTableTableManager get storedEntities =>
      $$StoredEntitiesTableTableManager(_db, _db.storedEntities);
  $$OfflineLeasesTableTableManager get offlineLeases =>
      $$OfflineLeasesTableTableManager(_db, _db.offlineLeases);
  $$SyncCursorsTableTableManager get syncCursors =>
      $$SyncCursorsTableTableManager(_db, _db.syncCursors);
  $$PendingEditsTableTableManager get pendingEdits =>
      $$PendingEditsTableTableManager(_db, _db.pendingEdits);
}
