import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get time => text()();
  TextColumn get date => text()();
  BoolColumn get isDone => boolean()();
}