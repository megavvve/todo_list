import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';


class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get time => text()();
  TextColumn get date => text()();
  BoolColumn get isDone => boolean()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Todos])
class AppDatabes extends _$AppDatabes {
  AppDatabes():super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  getTodoById(int id) {}
}
