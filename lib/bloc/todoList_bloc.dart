import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart';

part 'todoList_event.dart';
part 'todoList_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    on<AddTodos>(
      (event, emit) {
        print('fdfsdf');
      },
    );
  }
}


void _onAddTodos(AddTodos event, Emitter<TodosState> emit) {
  //emit(TodosState(allTodos: List.from(state.allTodos)..add(event.todo)));
}
