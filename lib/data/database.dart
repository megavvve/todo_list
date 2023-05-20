import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../domain/entity/repository_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'todos.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 2;

  Future<List<Todo>> getTodosList() async {
    return await select(todos).get();
  }

  Future<Todo> getTodo(int id) async {
    return await (select(todos)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateTodo(Todo entity) async {
    return await update(todos).replace(entity);
  }

  Future<int> addTodo(Todo entity) async {
    return await into(todos).insert(entity);
  }

  Future<int> deleteTodo(int id) async {
    return await (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
