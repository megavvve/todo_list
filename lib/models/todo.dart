//import 'package:json_serializable/json_serializable.dart';
part 'todo.g.dart';
class Todo {
  final String name;
  final String time;
  final String date;
  bool? isDone;

  Todo({
    required this.name,
    required this.time,
    required this.date, required isDone,
  }) {
    isDone = isDone ?? false;
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// Connect the generated [_$TodoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
