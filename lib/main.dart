import 'dart:math';

import 'package:drift/native.dart';
import 'package:drift/src/runtime/executor/executor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_hw2/bloc/todoList_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart';
import 'package:todo_list_hw2/repository/data/local/database/database.dart';

import 'package:todo_list_hw2/screens/mainScreen.dart';

Future<void> main() async {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
  );
 
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
 final db = AppDatabase();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc(db),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
          )),
          home: MyHomePage(
            db: db,
          ),
        ),
      ),
    );
  }
}
