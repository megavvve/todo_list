import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:todo_list_hw2/presentation/pages/main_screen.dart';

import 'domain/bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Todo App',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
          )),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
