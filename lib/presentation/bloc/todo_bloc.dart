import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/database.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodosBloc extends Bloc<TodoEvent, TodosState> {
  final db = AppDatabase();

  TodosBloc() : super(const TodosState()) {
    on<AddTodo>(_onAddTodo);
    on<InitLoad>(_onInitLoad);
    on<UpdateTodo>(_onUpdateTodos);
  }
  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    final todo = event.todo;
    
    db.addTodo(todo);
    emit(TodosState(todoList: List.from(state.todoList)..add(todo)));
  }

  void _onUpdateTodos(UpdateTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    final todo = event.todo;
    final int index = state.todoList.indexOf(todo);
    List<Todo> allTodos = List.from(state.todoList)..remove(todo);
    if (todo.isDone == false) {
      allTodos.insert(index, todo.copyWith(isDone: true));
      db.updateTodo(todo.copyWith(isDone: true));
    } else {
      allTodos.insert(index, todo.copyWith(isDone: false));

      db.updateTodo(todo.copyWith(isDone: false));
    }

    emit(TodosState(todoList: allTodos,),);
  }

  Future<void> _onInitLoad(InitLoad event, Emitter<TodosState> emit) async {

    List<Todo> allTodos = await db.getTodosList();

    emit(TodosState(todoList: allTodos,),);
  }
}
