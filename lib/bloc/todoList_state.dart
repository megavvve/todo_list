part of 'todoList_bloc.dart';

 class TodosState extends Equatable {
  //const TodosState();
  final List<Todo> allTodos;

  const TodosState( { this.allTodos = const <Todo>[]});

  @override
  // TODO: implement props
  List<Object> get props => [allTodos];
}
class NonEmptyTodoState extends TodosState {
  //const TodosState();
  

   

  @override
  // TODO: implement props
  List<Object> get props => [allTodos];
}

/*class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded({this.todos = const <Todo>[]}); 

  @override
  // TODO: implement props
  List<Object> get props => [todos];
}*/

class TodosEmptyState extends TodosState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



