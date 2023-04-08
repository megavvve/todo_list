class Todo {
  final String name;
  final String time;
  final String date;
  bool? isDone;

  Todo({
    required this.name,
    required this.time,
    required this.date,
    required this.isDone,
  });
  Todo copyWith({String? title, bool? isDone}) {
    return Todo(
      name: name,
      time: time,
      date: date,
      isDone: isDone ?? this.isDone,
    );
  }
}
