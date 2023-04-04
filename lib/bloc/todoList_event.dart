part of 'todoList_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

/*class LoadTodos extends TodosEvent {
  final List<Todo> todos;

  const LoadTodos({this.todos = const <Todo>[]});

  @override
  // TODO: implement props
  List<Object> get props => [todos];
}*/

class AddTodo extends TodosEvent {
  final Todo todo;

  const AddTodo({required this.todo});
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}
class UpdateTodos extends TodosEvent {
  final Todo todo;

  const UpdateTodos({required this.todo});
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}

class EventTodos extends TodosEvent {
  
final Todo todo;

  EventTodos(this.todo);

  
  @override
  // TODO: implement props
  List<Object> get props => [];
}
