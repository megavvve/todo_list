import 'package:flutter/material.dart';
import 'package:todo_list_hw2/bloc/todoList_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todoList = <Todo>[
    Todo(name: 'Task1', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task2', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task3', time: '22:22', date: '23:12:22', isDone: false),
    Todo(name: 'Task4', time: '22:22', date: '23:12:22', isDone: false),
  ];
  final _todoListBloc = TodosBloc();
  @override
  void initState() {
    _todoListBloc.add(AddTodos(
      todo: Todo(name: 'Task1', time: '22:22', date: '23:12:22', isDone: false),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
    );
  }
}
