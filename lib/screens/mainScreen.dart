import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/bloc/todoList_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart';
import 'package:todo_list_hw2/screens/addTodoScreen.dart';

import 'package:todo_list_hw2/screens/infoScreen.dart';
import 'package:todo_list_hw2/widgets/customArrow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/if_not_null_widget.dart';
import '../widgets/if_null_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;
  late Widget CenterOfScreen;
  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => const AddTodoScreen());
  }

  @override
  Widget build(BuildContext context) {
    
  
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        List<Todo> todosList = state.allTodos;
        if (todosList.isNotEmpty) {
          //CenterOfScreen = IfNullWidget();
          CenterOfScreen = IfNotNullWidget(
            todoList: todosList,
          );
        } if (todosList.isEmpty) {
          CenterOfScreen = IfNullWidget();
          /*CenterOfScreen = IfNotNullWidget(
            todoList: todosList,
          );*/
        } 
        ;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  'My tasks',
                  style: TextStyle(fontSize: 34.h, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 41.h,
                ),
                CenterOfScreen,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoScreen()),
                          );
                        },
                        tooltip: 'Info',
                        child: Icon(
                          Icons.info_rounded,
                          size: 42.h,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _addTask(context);
                        },
                        tooltip: 'Add ToDo',
                        child: Icon(
                          Icons.add,
                          size: 42.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: onSelectedTab,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sort_by_alpha_sharp,
                    size: 65.sp,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sort_by_alpha_outlined,
                    size: 65.sp,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sort,
                    size: 65.sp,
                  ),
                  label: ''),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        );
      },
    );
  }
}
