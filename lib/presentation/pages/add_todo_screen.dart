import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/data/local/database/database.dart';
import '../../domain/bloc/todo_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late AppDatabase _db;
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    DateTime dt = DateTime.now().toLocal();

    titleController = TextEditingController();
    dateController = TextEditingController(
        text:
            '${dt.day.toString().length == 1 ? "0${dt.day}" : dt.day}.${dt.month.toString().length == 1 ? "0${dt.month}" : dt.month}.${dt.year.toString()}');
    timeController = TextEditingController(
        text:
            '${(dt.hour).toString().length == 1 ? "0${dt.hour}" : dt.hour}:${dt.minute.toString().length == 1 ? "0${dt.minute}" : dt.minute}');
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
    _db.close();
    super.dispose();
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodosBloc>();
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return SizedBox(
          height: 760.h,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.w,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.chevron_left,
                            size: 40.sp,
                            color: Colors.blue,
                          ),
                          Text(
                            'Close',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 17.sp),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 70.w),
                    Text(
                      'Task',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 29.w, horizontal: 37.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a task',
                      style: TextStyle(
                          fontSize: 41.h, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        SizedBox(
                          width: 220.w,
                          child: TextField(
                            autofocus: true,
                            controller: titleController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade400,
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100),
                              ),
                              hintText: 'Lorem ipsum dolor sit amet',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 20.h, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        SizedBox(
                            width: 86.w,
                            child: TextField(
                              style: TextStyle(fontSize: 22.sp),
                              controller: timeController,
                              autofocus: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                hintStyle: TextStyle(
                                    fontSize: 22.h, color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade300),
                                border: const OutlineInputBorder(),
                                hintText: '00: 00',
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 20.h, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        SizedBox(
                            width: 163.w,
                            child: TextField(
                              style: TextStyle(fontSize: 22.sp),
                              autofocus: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                hintStyle: TextStyle(
                                    fontSize: 22.h, color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 28.h),
                                border: const OutlineInputBorder(),
                                hintText: '09.04.2023',
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 63.h,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.sp),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (titleController.text.isEmpty ||
                            timeController.text.isEmpty ||
                            dateController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Ошибка ввода данных'),
                                  content: const Text(
                                      'Одно или несколько полей не заполненны.'),
                                  actions: <Widget>[
                                    FloatingActionButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ок'),
                                    )
                                  ],
                                );
                              });
                        } else {
                          bloc.add(AddTodo(
                              todo: Todo(
                            name: titleController.text,
                            time: timeController.text,
                            date: dateController.text,
                            isDone: false,
                            id: state.todoList.isNotEmpty
                                ? state.todoList.last.id + 1
                                : 0,
                          )));

                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: 316.w,
                        height: 46.h,
                        color: Colors.black,
                        child: Center(
                            child: Text(
                          'Done',
                          style: TextStyle(fontSize: 14.sp),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
