import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/bloc/todoList_bloc.dart';
import 'package:todo_list_hw2/models/todo.dart' as TodoData;
import 'package:todo_list_hw2/repository/data/local/database/database.dart';
import 'package:todo_list_hw2/repository/data/local/entity/todos_entity.dart';
import 'package:todo_list_hw2/screens/addTodoScreen.dart';

import 'package:todo_list_hw2/screens/infoScreen.dart';
import 'package:todo_list_hw2/widgets/customArrow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/if_not_null_widget.dart';
import '../widgets/if_null_widget.dart';

class MyHomePage extends StatefulWidget {
  final AppDatabase db;
  const MyHomePage({
    super.key,
    required this.db,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AppDatabase _db;
  var todosList;
  int _selectedTab = 0;
  Widget CenterOfScreen = IfNullWidget();
  late Widget HideComplete;
  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
      print(_selectedTab);
    });
    if (_selectedTab == 0) {}
    if (_selectedTab == 1) {}
    if (_selectedTab == 2) {}
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _db = widget.db;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      //List<Todo> todosList = state;
      return FutureBuilder<List<Todo>>(
          future: _db.getTodosList(),
          builder: (context, snapshot) {
            if (state is TodosLoadedState) {
              final List<Todo>? todosList = snapshot.data;

              CenterOfScreen = IfNotNullWidget(
                todoList: todosList,
                db: _db,
              );
              HideComplete = TextButton(
                child: Text(
                  'Hide complete',
                  style: TextStyle(color: Colors.blue, fontSize: 13.sp),
                ),
                onPressed: () {
                  /*context
                  .read<TodosBloc>()
                  .add(HideComplitedTodos(todoList: todosList));
              print(state);*/
                  //че то делаем и у нас отображаются только невыполненые задачи
                },
              );
            }
            /*  if (todosList!.isEmpty) {
          CenterOfScreen = const IfNullWidget();
          //HideComplete = SizedBox();
        }*/
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
                    Row(
                      children: [
                        Text(
                          'My tasks',
                          style: TextStyle(
                              fontSize: 34.h, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        //HideComplete,
                      ],
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
                            heroTag: 'contact',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InfoScreen()),
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
          });
    });
  }
}
