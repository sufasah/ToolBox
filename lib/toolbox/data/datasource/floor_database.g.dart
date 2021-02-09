// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FAppDatabaseBuilder databaseBuilder(String name) =>
      _$FAppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FAppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FAppDatabaseBuilder(null);
}

class _$FAppDatabaseBuilder {
  _$FAppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$FAppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FAppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FAppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$FAppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FAppDatabase extends FAppDatabase {
  _$FAppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao _todoDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `todo_list` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `position` INTEGER NOT NULL, `title` TEXT NOT NULL, `details` TEXT NOT NULL, `done` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _todoInsertionAdapter = InsertionAdapter(
            database,
            'todo_list',
            (Todo item) => <String, dynamic>{
                  'id': item.id,
                  'position': item.position,
                  'title': item.title,
                  'details': item.details,
                  'done': item.isDone ? 1 : 0
                }),
        _todoUpdateAdapter = UpdateAdapter(
            database,
            'todo_list',
            ['id'],
            (Todo item) => <String, dynamic>{
                  'id': item.id,
                  'position': item.position,
                  'title': item.title,
                  'details': item.details,
                  'done': item.isDone ? 1 : 0
                }),
        _todoDeletionAdapter = DeletionAdapter(
            database,
            'todo_list',
            ['id'],
            (Todo item) => <String, dynamic>{
                  'id': item.id,
                  'position': item.position,
                  'title': item.title,
                  'details': item.details,
                  'done': item.isDone ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Todo> _todoInsertionAdapter;

  final UpdateAdapter<Todo> _todoUpdateAdapter;

  final DeletionAdapter<Todo> _todoDeletionAdapter;

  @override
  Future<List<Todo>> getAllTodo() async {
    return _queryAdapter.queryList('SELECT * FROM todo_list',
        mapper: (Map<String, dynamic> row) => Todo(
            id: row['id'] as int,
            position: row['position'] as int,
            title: row['title'] as String,
            details: row['details'] as String,
            isDone: (row['done'] as int) != 0));
  }

  @override
  Future<List<Todo>> getAllTodoOrdered() async {
    return _queryAdapter.queryList(
        'SELECT * FROM todo_list ORDER BY position ASC',
        mapper: (Map<String, dynamic> row) => Todo(
            id: row['id'] as int,
            position: row['position'] as int,
            title: row['title'] as String,
            details: row['details'] as String,
            isDone: (row['done'] as int) != 0));
  }

  @override
  Future<Todo> getTodo(int id) async {
    return _queryAdapter.query('SELECT * FROM todo_list WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Todo(
            id: row['id'] as int,
            position: row['position'] as int,
            title: row['title'] as String,
            details: row['details'] as String,
            isDone: (row['done'] as int) != 0));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM todo_list');
  }

  @override
  Future<int> insertTodo(Todo entity) {
    return _todoInsertionAdapter.insertAndReturnId(
        entity, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTodo(Todo entity) {
    return _todoUpdateAdapter.updateAndReturnChangedRows(
        entity, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTodo(Todo entity) {
    return _todoDeletionAdapter.deleteAndReturnChangedRows(entity);
  }

  @override
  Future<void> updateTodos(List<Todo> todos) async {
    if (database is sqflite.Transaction) {
      await super.updateTodos(todos);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$FAppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.todoDao.updateTodos(todos);
      });
    }
  }
}
