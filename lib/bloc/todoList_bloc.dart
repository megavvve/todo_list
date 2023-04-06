import 'package:drift/native.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite3/src/ffi/api.dart';
import 'package:todo_list_hw2/models/todo.dart' as todo;
import 'package:todo_list_hw2/repository/data/local/entity/todos_entity.dart';
import 'package:todo_list_hw2/widgets/if_null_widget.dart';

import '../repository/data/local/database/database.dart';

//import '../repository/data/local/database/database.dart';

part 'todoList_event.dart';
part 'todoList_state.dart';

/*class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc()
      : super(
          TodosState(),
        ) {
    on<AddTodo>(_onAddTodo);
    on<UpdateTodos>(_onUpdateTodos);
    on<HideComplitedTodos>(_onHideComplitedTodos);
  }
  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final currentState = state.alltodos;
    
     var allTodos = List.from(currentState)..add(event);
    emit(LoadTodosState(allTodos:allTodos));
  }

  void _onUpdateTodos(UpdateTodos event, Emitter<TodosState> emit) {
    final currentState = state;
    final todo = event.todo;
    final int index = state.allTodos.indexOf(todo);
    List<Todo> allTodos = List.from(currentState.allTodos)..remove(todo);
    todo.isDone == false
        ? allTodos.insert(index, todo.copyWith(isDone: true))
        : allTodos.insert(index, todo.copyWith(isDone: false));
    emit(LoadTodosState(allTodos: allTodos));
  }

  void _onHideComplitedTodos(
      HideComplitedTodos event, Emitter<TodosState> emit) {
    final todoList = event.todoList;

    emit(HideCompleteState(todoList.where((x) => x.isDone == false).toList()));
  }
}*/

class TodosBloc extends Bloc<TodoEvent, TodosState> {
  final AppDatabase _todoRepository;
 
  TodosBloc(this._todoRepository) : super( const TodosState()) {
    on<AddTodo>(_onAddTodo);
    on<GetTodos>(_onGetTodo);
   // on<UpdateTodo>(_onUpdateTodos);
    //on<HideComplitedTodos>(_onHideComplitedTodos);
  }
    Future<void> _onAddTodo(AddTodo event, Emitter<TodosState> emit) async {
    await _todoRepository.addTodo(event.todo);
    emit(TodosLoadedState());
    
  }
  Future<void> _onGetTodo(GetTodos event, Emitter<TodosState> emit) async {
    await _todoRepository.getTodosList();
    emit(TodosLoadedState());
    
  }
  /*Future<void> _onUpdateTodos(UpdateTodo event, Emitter<TodosState> emit) async {
    await _todoRepository.addTodo(event.todo);
    emit(TodosLoadedState());
  }*/
}

  /*Stream<TodosState> mapEventToState(TodoEvent event) async* {



    if (event is LoadTodos) {
      yield TodosLoadingState();
      try {
        final todos = await _todoRepository.getTodosList();
        yield TodosLoadedState(todos);
      } catch (e) {
        yield TodosErrorState("Failed to load todos: $e");
      }
    } else if (event is AddTodo) {
      try {
        await _todoRepository.insertTodo(event.todo );
        final todos = await _todoRepository.getTodosList();
        yield TodosLoadedState(todos);
      } catch (e) {
        yield TodosErrorState("Failed to add todo: $e");
      }
    } else if (event is UpdateTodo) {
      try {
        await _todoRepository.updateTodo(event.updatedTodo as TodosCompanion);
        final todos = await _todoRepository.getTodosList();
        yield TodosLoadedState(todos);
      } catch (e) {
        yield TodosErrorState("Failed to update todo: $e");
      }
    } else if (event is DeleteTodo) {
      try {
        await _todoRepository.deleteTodo(event.todo.id as int);
        final todos = await _todoRepository.getTodosList();
        yield TodosLoadedState(todos);
      } catch (e) {
        yield TodosErrorState("Failed to delete todo: $e");
      }
    }
  }
}*/





