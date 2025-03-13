// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalNotificationsTable extends LocalNotifications
    with TableInfo<$LocalNotificationsTable, LocalNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
      'read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sentTimeMeta =
      const VerificationMeta('sentTime');
  @override
  late final GeneratedColumn<DateTime> sentTime = GeneratedColumn<DateTime>(
      'sent_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<LocalNotificationType, String>
      type = GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LocalNotificationType>(
              $LocalNotificationsTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, title, body, read, sentTime, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<LocalNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    }
    if (data.containsKey('sent_time')) {
      context.handle(_sentTimeMeta,
          sentTime.isAcceptableOrUnknown(data['sent_time']!, _sentTimeMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LocalNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalNotification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body']),
      read: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}read'])!,
      sentTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sent_time'])!,
      type: $LocalNotificationsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $LocalNotificationsTable createAlias(String alias) {
    return $LocalNotificationsTable(attachedDatabase, alias);
  }

  static TypeConverter<LocalNotificationType, String> $convertertype =
      const LocalNotificationTypeConverter();
}

class LocalNotification extends DataClass
    implements Insertable<LocalNotification> {
  final int id;
  final String? title;
  final String? body;
  final bool read;
  final DateTime sentTime;
  final LocalNotificationType type;
  const LocalNotification(
      {required this.id,
      this.title,
      this.body,
      required this.read,
      required this.sentTime,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['read'] = Variable<bool>(read);
    map['sent_time'] = Variable<DateTime>(sentTime);
    {
      map['type'] =
          Variable<String>($LocalNotificationsTable.$convertertype.toSql(type));
    }
    return map;
  }

  LocalNotificationsCompanion toCompanion(bool nullToAbsent) {
    return LocalNotificationsCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      read: Value(read),
      sentTime: Value(sentTime),
      type: Value(type),
    );
  }

  factory LocalNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalNotification(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      body: serializer.fromJson<String?>(json['body']),
      read: serializer.fromJson<bool>(json['read']),
      sentTime: serializer.fromJson<DateTime>(json['sentTime']),
      type: serializer.fromJson<LocalNotificationType>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'body': serializer.toJson<String?>(body),
      'read': serializer.toJson<bool>(read),
      'sentTime': serializer.toJson<DateTime>(sentTime),
      'type': serializer.toJson<LocalNotificationType>(type),
    };
  }

  LocalNotification copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> body = const Value.absent(),
          bool? read,
          DateTime? sentTime,
          LocalNotificationType? type}) =>
      LocalNotification(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        body: body.present ? body.value : this.body,
        read: read ?? this.read,
        sentTime: sentTime ?? this.sentTime,
        type: type ?? this.type,
      );
  LocalNotification copyWithCompanion(LocalNotificationsCompanion data) {
    return LocalNotification(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      read: data.read.present ? data.read.value : this.read,
      sentTime: data.sentTime.present ? data.sentTime.value : this.sentTime,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotification(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('read: $read, ')
          ..write('sentTime: $sentTime, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, body, read, sentTime, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalNotification &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.read == this.read &&
          other.sentTime == this.sentTime &&
          other.type == this.type);
}

class LocalNotificationsCompanion extends UpdateCompanion<LocalNotification> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> body;
  final Value<bool> read;
  final Value<DateTime> sentTime;
  final Value<LocalNotificationType> type;
  final Value<int> rowid;
  const LocalNotificationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.read = const Value.absent(),
    this.sentTime = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalNotificationsCompanion.insert({
    required int id,
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.read = const Value.absent(),
    this.sentTime = const Value.absent(),
    required LocalNotificationType type,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type);
  static Insertable<LocalNotification> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<bool>? read,
    Expression<DateTime>? sentTime,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (read != null) 'read': read,
      if (sentTime != null) 'sent_time': sentTime,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalNotificationsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? body,
      Value<bool>? read,
      Value<DateTime>? sentTime,
      Value<LocalNotificationType>? type,
      Value<int>? rowid}) {
    return LocalNotificationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      read: read ?? this.read,
      sentTime: sentTime ?? this.sentTime,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (sentTime.present) {
      map['sent_time'] = Variable<DateTime>(sentTime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $LocalNotificationsTable.$convertertype.toSql(type.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('read: $read, ')
          ..write('sentTime: $sentTime, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineStatementsTable extends OfflineStatements
    with TableInfo<$OfflineStatementsTable, OfflineStatement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineStatementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
      'video_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trackinJsongObjectMeta =
      const VerificationMeta('trackinJsongObject');
  @override
  late final GeneratedColumn<String> trackinJsongObject =
      GeneratedColumn<String>('trackin_jsong_object', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _offlineVideoJsongObjectMeta =
      const VerificationMeta('offlineVideoJsongObject');
  @override
  late final GeneratedColumn<String> offlineVideoJsongObject =
      GeneratedColumn<String>('offline_video_jsong_object', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<PlayerEvent, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PlayerEvent>($OfflineStatementsTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns =>
      [timestamp, videoId, trackinJsongObject, offlineVideoJsongObject, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_statements';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineStatement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    }
    if (data.containsKey('trackin_jsong_object')) {
      context.handle(
          _trackinJsongObjectMeta,
          trackinJsongObject.isAcceptableOrUnknown(
              data['trackin_jsong_object']!, _trackinJsongObjectMeta));
    }
    if (data.containsKey('offline_video_jsong_object')) {
      context.handle(
          _offlineVideoJsongObjectMeta,
          offlineVideoJsongObject.isAcceptableOrUnknown(
              data['offline_video_jsong_object']!,
              _offlineVideoJsongObjectMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  OfflineStatement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineStatement(
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_id']),
      trackinJsongObject: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}trackin_jsong_object']),
      offlineVideoJsongObject: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}offline_video_jsong_object']),
      type: $OfflineStatementsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $OfflineStatementsTable createAlias(String alias) {
    return $OfflineStatementsTable(attachedDatabase, alias);
  }

  static TypeConverter<PlayerEvent, String> $convertertype =
      const VideoStatementTypeConverter();
}

class OfflineStatement extends DataClass
    implements Insertable<OfflineStatement> {
  final DateTime timestamp;
  final String? videoId;
  final String? trackinJsongObject;
  final String? offlineVideoJsongObject;
  final PlayerEvent type;
  const OfflineStatement(
      {required this.timestamp,
      this.videoId,
      this.trackinJsongObject,
      this.offlineVideoJsongObject,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || videoId != null) {
      map['video_id'] = Variable<String>(videoId);
    }
    if (!nullToAbsent || trackinJsongObject != null) {
      map['trackin_jsong_object'] = Variable<String>(trackinJsongObject);
    }
    if (!nullToAbsent || offlineVideoJsongObject != null) {
      map['offline_video_jsong_object'] =
          Variable<String>(offlineVideoJsongObject);
    }
    {
      map['type'] =
          Variable<String>($OfflineStatementsTable.$convertertype.toSql(type));
    }
    return map;
  }

  OfflineStatementsCompanion toCompanion(bool nullToAbsent) {
    return OfflineStatementsCompanion(
      timestamp: Value(timestamp),
      videoId: videoId == null && nullToAbsent
          ? const Value.absent()
          : Value(videoId),
      trackinJsongObject: trackinJsongObject == null && nullToAbsent
          ? const Value.absent()
          : Value(trackinJsongObject),
      offlineVideoJsongObject: offlineVideoJsongObject == null && nullToAbsent
          ? const Value.absent()
          : Value(offlineVideoJsongObject),
      type: Value(type),
    );
  }

  factory OfflineStatement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineStatement(
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      videoId: serializer.fromJson<String?>(json['videoId']),
      trackinJsongObject:
          serializer.fromJson<String?>(json['trackinJsongObject']),
      offlineVideoJsongObject:
          serializer.fromJson<String?>(json['offlineVideoJsongObject']),
      type: serializer.fromJson<PlayerEvent>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'videoId': serializer.toJson<String?>(videoId),
      'trackinJsongObject': serializer.toJson<String?>(trackinJsongObject),
      'offlineVideoJsongObject':
          serializer.toJson<String?>(offlineVideoJsongObject),
      'type': serializer.toJson<PlayerEvent>(type),
    };
  }

  OfflineStatement copyWith(
          {DateTime? timestamp,
          Value<String?> videoId = const Value.absent(),
          Value<String?> trackinJsongObject = const Value.absent(),
          Value<String?> offlineVideoJsongObject = const Value.absent(),
          PlayerEvent? type}) =>
      OfflineStatement(
        timestamp: timestamp ?? this.timestamp,
        videoId: videoId.present ? videoId.value : this.videoId,
        trackinJsongObject: trackinJsongObject.present
            ? trackinJsongObject.value
            : this.trackinJsongObject,
        offlineVideoJsongObject: offlineVideoJsongObject.present
            ? offlineVideoJsongObject.value
            : this.offlineVideoJsongObject,
        type: type ?? this.type,
      );
  OfflineStatement copyWithCompanion(OfflineStatementsCompanion data) {
    return OfflineStatement(
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      trackinJsongObject: data.trackinJsongObject.present
          ? data.trackinJsongObject.value
          : this.trackinJsongObject,
      offlineVideoJsongObject: data.offlineVideoJsongObject.present
          ? data.offlineVideoJsongObject.value
          : this.offlineVideoJsongObject,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineStatement(')
          ..write('timestamp: $timestamp, ')
          ..write('videoId: $videoId, ')
          ..write('trackinJsongObject: $trackinJsongObject, ')
          ..write('offlineVideoJsongObject: $offlineVideoJsongObject, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      timestamp, videoId, trackinJsongObject, offlineVideoJsongObject, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineStatement &&
          other.timestamp == this.timestamp &&
          other.videoId == this.videoId &&
          other.trackinJsongObject == this.trackinJsongObject &&
          other.offlineVideoJsongObject == this.offlineVideoJsongObject &&
          other.type == this.type);
}

class OfflineStatementsCompanion extends UpdateCompanion<OfflineStatement> {
  final Value<DateTime> timestamp;
  final Value<String?> videoId;
  final Value<String?> trackinJsongObject;
  final Value<String?> offlineVideoJsongObject;
  final Value<PlayerEvent> type;
  final Value<int> rowid;
  const OfflineStatementsCompanion({
    this.timestamp = const Value.absent(),
    this.videoId = const Value.absent(),
    this.trackinJsongObject = const Value.absent(),
    this.offlineVideoJsongObject = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineStatementsCompanion.insert({
    this.timestamp = const Value.absent(),
    this.videoId = const Value.absent(),
    this.trackinJsongObject = const Value.absent(),
    this.offlineVideoJsongObject = const Value.absent(),
    required PlayerEvent type,
    this.rowid = const Value.absent(),
  }) : type = Value(type);
  static Insertable<OfflineStatement> custom({
    Expression<DateTime>? timestamp,
    Expression<String>? videoId,
    Expression<String>? trackinJsongObject,
    Expression<String>? offlineVideoJsongObject,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (timestamp != null) 'timestamp': timestamp,
      if (videoId != null) 'video_id': videoId,
      if (trackinJsongObject != null)
        'trackin_jsong_object': trackinJsongObject,
      if (offlineVideoJsongObject != null)
        'offline_video_jsong_object': offlineVideoJsongObject,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineStatementsCompanion copyWith(
      {Value<DateTime>? timestamp,
      Value<String?>? videoId,
      Value<String?>? trackinJsongObject,
      Value<String?>? offlineVideoJsongObject,
      Value<PlayerEvent>? type,
      Value<int>? rowid}) {
    return OfflineStatementsCompanion(
      timestamp: timestamp ?? this.timestamp,
      videoId: videoId ?? this.videoId,
      trackinJsongObject: trackinJsongObject ?? this.trackinJsongObject,
      offlineVideoJsongObject:
          offlineVideoJsongObject ?? this.offlineVideoJsongObject,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    if (trackinJsongObject.present) {
      map['trackin_jsong_object'] = Variable<String>(trackinJsongObject.value);
    }
    if (offlineVideoJsongObject.present) {
      map['offline_video_jsong_object'] =
          Variable<String>(offlineVideoJsongObject.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $OfflineStatementsTable.$convertertype.toSql(type.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineStatementsCompanion(')
          ..write('timestamp: $timestamp, ')
          ..write('videoId: $videoId, ')
          ..write('trackinJsongObject: $trackinJsongObject, ')
          ..write('offlineVideoJsongObject: $offlineVideoJsongObject, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalNotificationsTable localNotifications =
      $LocalNotificationsTable(this);
  late final $OfflineStatementsTable offlineStatements =
      $OfflineStatementsTable(this);
  late final LocalNotificationsDao localNotificationsDao =
      LocalNotificationsDao(this as AppDatabase);
  late final OfflineStatementsDao offlineStatementsDao =
      OfflineStatementsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localNotifications, offlineStatements];
}

typedef $$LocalNotificationsTableCreateCompanionBuilder
    = LocalNotificationsCompanion Function({
  required int id,
  Value<String?> title,
  Value<String?> body,
  Value<bool> read,
  Value<DateTime> sentTime,
  required LocalNotificationType type,
  Value<int> rowid,
});
typedef $$LocalNotificationsTableUpdateCompanionBuilder
    = LocalNotificationsCompanion Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> body,
  Value<bool> read,
  Value<DateTime> sentTime,
  Value<LocalNotificationType> type,
  Value<int> rowid,
});

class $$LocalNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get read => $composableBuilder(
      column: $table.read, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sentTime => $composableBuilder(
      column: $table.sentTime, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LocalNotificationType, LocalNotificationType,
          String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$LocalNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get read => $composableBuilder(
      column: $table.read, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sentTime => $composableBuilder(
      column: $table.sentTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$LocalNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<bool> get read =>
      $composableBuilder(column: $table.read, builder: (column) => column);

  GeneratedColumn<DateTime> get sentTime =>
      $composableBuilder(column: $table.sentTime, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LocalNotificationType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$LocalNotificationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalNotificationsTable,
    LocalNotification,
    $$LocalNotificationsTableFilterComposer,
    $$LocalNotificationsTableOrderingComposer,
    $$LocalNotificationsTableAnnotationComposer,
    $$LocalNotificationsTableCreateCompanionBuilder,
    $$LocalNotificationsTableUpdateCompanionBuilder,
    (
      LocalNotification,
      BaseReferences<_$AppDatabase, $LocalNotificationsTable, LocalNotification>
    ),
    LocalNotification,
    PrefetchHooks Function()> {
  $$LocalNotificationsTableTableManager(
      _$AppDatabase db, $LocalNotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalNotificationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> body = const Value.absent(),
            Value<bool> read = const Value.absent(),
            Value<DateTime> sentTime = const Value.absent(),
            Value<LocalNotificationType> type = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalNotificationsCompanion(
            id: id,
            title: title,
            body: body,
            read: read,
            sentTime: sentTime,
            type: type,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<String?> title = const Value.absent(),
            Value<String?> body = const Value.absent(),
            Value<bool> read = const Value.absent(),
            Value<DateTime> sentTime = const Value.absent(),
            required LocalNotificationType type,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocalNotificationsCompanion.insert(
            id: id,
            title: title,
            body: body,
            read: read,
            sentTime: sentTime,
            type: type,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalNotificationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalNotificationsTable,
    LocalNotification,
    $$LocalNotificationsTableFilterComposer,
    $$LocalNotificationsTableOrderingComposer,
    $$LocalNotificationsTableAnnotationComposer,
    $$LocalNotificationsTableCreateCompanionBuilder,
    $$LocalNotificationsTableUpdateCompanionBuilder,
    (
      LocalNotification,
      BaseReferences<_$AppDatabase, $LocalNotificationsTable, LocalNotification>
    ),
    LocalNotification,
    PrefetchHooks Function()>;
typedef $$OfflineStatementsTableCreateCompanionBuilder
    = OfflineStatementsCompanion Function({
  Value<DateTime> timestamp,
  Value<String?> videoId,
  Value<String?> trackinJsongObject,
  Value<String?> offlineVideoJsongObject,
  required PlayerEvent type,
  Value<int> rowid,
});
typedef $$OfflineStatementsTableUpdateCompanionBuilder
    = OfflineStatementsCompanion Function({
  Value<DateTime> timestamp,
  Value<String?> videoId,
  Value<String?> trackinJsongObject,
  Value<String?> offlineVideoJsongObject,
  Value<PlayerEvent> type,
  Value<int> rowid,
});

class $$OfflineStatementsTableFilterComposer
    extends Composer<_$AppDatabase, $OfflineStatementsTable> {
  $$OfflineStatementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trackinJsongObject => $composableBuilder(
      column: $table.trackinJsongObject,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get offlineVideoJsongObject => $composableBuilder(
      column: $table.offlineVideoJsongObject,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PlayerEvent, PlayerEvent, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$OfflineStatementsTableOrderingComposer
    extends Composer<_$AppDatabase, $OfflineStatementsTable> {
  $$OfflineStatementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trackinJsongObject => $composableBuilder(
      column: $table.trackinJsongObject,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get offlineVideoJsongObject => $composableBuilder(
      column: $table.offlineVideoJsongObject,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$OfflineStatementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfflineStatementsTable> {
  $$OfflineStatementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<String> get trackinJsongObject => $composableBuilder(
      column: $table.trackinJsongObject, builder: (column) => column);

  GeneratedColumn<String> get offlineVideoJsongObject => $composableBuilder(
      column: $table.offlineVideoJsongObject, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PlayerEvent, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$OfflineStatementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfflineStatementsTable,
    OfflineStatement,
    $$OfflineStatementsTableFilterComposer,
    $$OfflineStatementsTableOrderingComposer,
    $$OfflineStatementsTableAnnotationComposer,
    $$OfflineStatementsTableCreateCompanionBuilder,
    $$OfflineStatementsTableUpdateCompanionBuilder,
    (
      OfflineStatement,
      BaseReferences<_$AppDatabase, $OfflineStatementsTable, OfflineStatement>
    ),
    OfflineStatement,
    PrefetchHooks Function()> {
  $$OfflineStatementsTableTableManager(
      _$AppDatabase db, $OfflineStatementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineStatementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineStatementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineStatementsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> timestamp = const Value.absent(),
            Value<String?> videoId = const Value.absent(),
            Value<String?> trackinJsongObject = const Value.absent(),
            Value<String?> offlineVideoJsongObject = const Value.absent(),
            Value<PlayerEvent> type = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineStatementsCompanion(
            timestamp: timestamp,
            videoId: videoId,
            trackinJsongObject: trackinJsongObject,
            offlineVideoJsongObject: offlineVideoJsongObject,
            type: type,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<DateTime> timestamp = const Value.absent(),
            Value<String?> videoId = const Value.absent(),
            Value<String?> trackinJsongObject = const Value.absent(),
            Value<String?> offlineVideoJsongObject = const Value.absent(),
            required PlayerEvent type,
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineStatementsCompanion.insert(
            timestamp: timestamp,
            videoId: videoId,
            trackinJsongObject: trackinJsongObject,
            offlineVideoJsongObject: offlineVideoJsongObject,
            type: type,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflineStatementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OfflineStatementsTable,
    OfflineStatement,
    $$OfflineStatementsTableFilterComposer,
    $$OfflineStatementsTableOrderingComposer,
    $$OfflineStatementsTableAnnotationComposer,
    $$OfflineStatementsTableCreateCompanionBuilder,
    $$OfflineStatementsTableUpdateCompanionBuilder,
    (
      OfflineStatement,
      BaseReferences<_$AppDatabase, $OfflineStatementsTable, OfflineStatement>
    ),
    OfflineStatement,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalNotificationsTableTableManager get localNotifications =>
      $$LocalNotificationsTableTableManager(_db, _db.localNotifications);
  $$OfflineStatementsTableTableManager get offlineStatements =>
      $$OfflineStatementsTableTableManager(_db, _db.offlineStatements);
}
