part of 'todoList_bloc.dart';

/*
/*class TodosState extends Equatable {
  //const TodosState();
  // final _migrationRunner =NativeDatabase.memory();
  //final  database;
  //final List alltodos;
   Future<List<Todos>> alltodos;
    TodosState({this.alltodos });

  @override
  // TODO: implement props
  List<Object> get props => [alltodos];
}*/
class TodoState extends Equatable {
  const TodoState({
    required this.todos,
    required this.status,
  });

  final List<Todo> todos;
  final TodoStatus status;

  const TodoState.loading() : this(todos: const [], status: TodoStatus.loading);

  const TodoState.loaded(List<Todo> todos)
      : this(todos: todos, status: TodoStatus.loaded);

  const TodoState.error(String message)
      : this(todos: const [], status: TodoStatus.error, message: message);

  final String? message;

  @override
  List<Object?> get props => [todos, status, message];
}

class LoadTodosState extends TodosState {
  //const TodosState();
   var alltodos;

   LoadTodosState(this.alltodos, );

  @override
  // TODO: implement props
  List<Object> get props => [alltodos];
}

/*class HideCompleteState extends LoadTodosState {
  //const TodosState();
  final List<Todos> allTodos;

  HideCompleteState(this.allTodos) : super(null);

  

  

  @override
  // TODO: implement props
  List<Object> get props => [allTodos];
}*/*/

 class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosErrorState extends TodosState {
  final String error;

  TodosErrorState(this.error);
}

class TodosLoadingState extends TodosState {}

class TodosLoadedState extends TodosState {
  final List<Todo> todos;

  const TodosLoadedState([this.todos = const []]);

  @override
  List<Object> get props => [todos];
}

class TodosNotLoaded extends TodosState {}
