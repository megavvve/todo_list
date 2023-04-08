part of 'todo_bloc.dart';

class TodosState extends Equatable {
  final List<Todo> todoList;
  const TodosState({this.todoList = const <Todo>[]});

  @override
  List<Object> get props => [todoList];
}
