part of 'todoList_bloc.dart';

abstract class TodosEvent extends Equatable{}

class AddTodos extends TodosEvent {
  final Todo todo;

  AddTodos({required this.todo});
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}
