import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/widgets/todo_tile.dart';

import '../repository/data/local/database/database.dart';

//import '../models/todo.dart';

class IfNotNullWidget extends StatelessWidget {
  final AppDatabase db;
  final List<Todo>? todoList;
  const IfNotNullWidget({super.key, required this.todoList, required this.db});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450.h,
          child: ListView.builder(
            itemCount: todoList!.length,
            itemBuilder: (context, index) {
              return TodoTile(
                todo: todoList![index],
              );
            },
          ),
        ),
      ],
    );
  }
}
