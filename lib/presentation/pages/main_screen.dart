import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_hw2/presentation/pages/add_todo_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_hw2/presentation/pages/info_screen.dart';

import '../../data/repository/data/local/database/database.dart';
import '../../domain/bloc/todo_bloc.dart';

import '../widgets/if_not_null_widget.dart';
import '../widgets/if_null_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AppDatabase db;
  int _selectedTab = 0;
  late Widget CenterOfScreen;
  Widget HideorShowCompleted = const SizedBox();
  String sortType = "";
  bool isHideCompleted = true;
  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;

      print(_selectedTab);
      if (_selectedTab == 0) {
        sortType = "sortAlphabetically";
      }
      if (_selectedTab == 1) {
        sortType = "sortAlphabeticallyInReverseOrder";
      }
      if (_selectedTab == 2) {
        sortType = "sortingByCreationDate";
      }
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
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<TodosBloc>(context);
    bloc.add(const InitLoad());
    db = AppDatabase();
    //db.deleteEverything();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      if (state.todoList.isNotEmpty) {
        HideorShowCompleted = TextButton(
          child: Text(
            isHideCompleted ? 'Hide completed' : 'Show completed',
            style: TextStyle(color: Colors.blue, fontSize: 13.sp),
          ),
          onPressed: () {
            setState(() {
              isHideCompleted = !isHideCompleted;
            });

          },
        );
        CenterOfScreen = IfNotNullWidget(
          isHideCompleted: isHideCompleted,
          sortType: sortType,
          todoList: state.todoList,
        );
      }
      if (state.todoList.isEmpty) {
        CenterOfScreen = IfNullWidget();
      }

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
                    style:
                        TextStyle(fontSize: 34.h, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  HideorShowCompleted,
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
                      child: SvgPicture.asset('assets/icons/iconInfo.svg',height: 35.h,),
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
                icon: SvgPicture.asset('assets/icons/iconSort1.svg',height: 50.h,color:_selectedTab==0? Colors.blue:Colors.black,),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/iconSort2.svg',height: 50.h,color:_selectedTab==1? Colors.blue:Colors.black,),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/iconSort3.svg',height: 50.h,color:_selectedTab==2? Colors.blue:Colors.black,),
                label: ''),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
    });
  }
}
