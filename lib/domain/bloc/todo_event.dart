part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class InitLoad extends TodoEvent {
  const InitLoad();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class GetTodos extends TodoEvent {
  const GetTodos();
  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
