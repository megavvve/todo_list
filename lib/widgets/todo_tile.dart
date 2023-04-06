import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_hw2/repository/data/local/database/database.dart';

import '../bloc/todoList_bloc.dart';
//import '../models/todo.dart';

class TodoTile extends StatefulWidget {
  
  final Todo todo;
  const TodoTile({super.key, required this.todo});
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    var todo = widget.todo;
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
                side: BorderSide(
                  color: Colors.grey,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                value: todo.isDone,
                onChanged: (value) {

                  //context.read<TodosBloc>().add(UpdateTodo(updatedTodo:todo));
                }),
          ),
          SizedBox(
            width: 13.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 270.w,
                child: Text(
                  todo.name,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: todo.isDone
                        ? Colors.grey.shade400
                        : Colors.grey.shade700,
                    decoration:
                        todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    todo.date,
                    style: TextStyle(
                      color: todo.isDone ? Colors.grey.shade400 : Colors.grey,
                      fontSize: 13.sp,
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    todo.time,
                    style: TextStyle(
                      color: todo.isDone ? Colors.grey.shade400 : Colors.grey,
                      fontSize: 13.sp,
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
