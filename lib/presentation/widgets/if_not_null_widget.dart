import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/presentation/widgets/todo_tile.dart';

import '../../data/repository/data/local/database/database.dart';



class IfNotNullWidget extends StatelessWidget {
  final bool isHideCompleted;
  final List<Todo> todoList;
  final String sortType;

  const IfNotNullWidget(
      {super.key,
      required this.todoList,
      required this.sortType,
      required this.isHideCompleted});

  @override
  Widget build(BuildContext context) {
    List<Todo> todoListNew = isHideCompleted
        ? todoList
        : todoList.where((x) => x.isDone == false).toList();
    var sortedTodolist;
    if (sortType == "sortAlphabetically") {
      sortedTodolist = List<Todo>.from(todoListNew)
        ..sort((a, b) => a.name.compareTo(b.name));
    }
    if (sortType == "sortAlphabeticallyInReverseOrder") {
      sortedTodolist = (List<Todo>.from(todoListNew)
            ..sort((a, b) => a.name.compareTo(b.name)))
          .reversed
          .toList();
    }
    if (sortType == "sortingByCreationDate") {
      sortedTodolist = (List<Todo>.from(todoListNew)
            ..sort((a, b) {
              final dateComparison = a.date.compareTo(b.date);
              if (dateComparison != 0) {
                return dateComparison;
              }
              return a.time.compareTo(b.time);
            }))
          .reversed
          .toList();
    }

    return Column(
      children: [
        SizedBox(
          height: 450.h,
          child: ListView.builder(
            itemCount: todoListNew.length,
            itemBuilder: (context, index) {
              return TodoTile(
                todo: (sortedTodolist != null)
                    ? sortedTodolist[index]
                    : todoList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
