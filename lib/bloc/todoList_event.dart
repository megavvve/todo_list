part of 'todoList_bloc.dart';

/*abstract class TodosEvent extends Equatable {
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
  final Todos todo;

  const AddTodo({required this.todo});
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}
class UpdateTodos extends TodosEvent {
  final Todos todo;

  const UpdateTodos({required this.todo});
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}
class HideComplitedTodos extends TodosEvent {
  final List<Todos> todoList;

  const HideComplitedTodos({required this.todoList});
  @override
  // TODO: implement props
  List<Object> get props => [todoList];
}
*/

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class GetTodos extends TodoEvent {
  final List<Todo> todoList;

  GetTodos(this.todoList);
  @override
  List<Object> get props => [todoList];
}

class AddTodo extends TodoEvent {
  final TodosCompanion todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class UpdateTodo extends TodoEvent {
  final Todos updatedTodo;

  const UpdateTodo(this.updatedTodo);

  @override
  List<Object> get props => [updatedTodo];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedTodo }';
}

class DeleteTodo extends TodoEvent {
  final Todos todo;

  const DeleteTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'DeleteTodo { todo: $todo }';
}
