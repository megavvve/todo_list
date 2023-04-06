class Todo {
  final String name;
  final String time;
  final String date;
  bool? isDone ;

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
      date:date,
      isDone: isDone ?? this.isDone,
    );
  }

  /*static List<Todo> todoList = <Todo>[
    Todo(name: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task2', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task3', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task4', time: '22:22', date: '23:12:22', isDone: false),
  ];*/
}
