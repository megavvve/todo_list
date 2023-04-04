import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart';
import 'package:todo_list_hw2/widgets/if_null_widget.dart';

part 'todoList_event.dart';
part 'todoList_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc()
      : super(
          const TodosState(),
        ) {
    on<AddTodo>((event, emit) {
      final currentState = state.allTodos;
      final List<Todo> allTodos = List.from(currentState)..add(event.todo);
      emit(TodosState(allTodos: allTodos));
    }); 
    
    
   /* on<UpdateTodos>(((event, emit) {
      final currentState = this.state;
      final todo = event.todo;
      List<Todo> allTodos = List.from(currentState.allTodos)..remove(todo);
      
      emit(TodosState(allTodos: allTodos));
    }));*/
  }
}

