import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/presentation/bloc/todo_bloc.dart';


import 'package:todo_list_hw2/presentation/pages/main_screen/main_screen.dart';



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
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
          )),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
