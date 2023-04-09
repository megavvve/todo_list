import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/screens/arrow_screen.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/screens/todos_screen.dart';

import '../../../data/repository/data/local/database/database.dart';
import '../../../domain/bloc/todo_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppDatabase db;
  int _selectedTab = 0;
  late Widget body;
  String sortType = "";
  bool isHideCompleted = true;
  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
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

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<TodosBloc>(context);
    bloc.add(const InitLoad());
    db = AppDatabase();
    //db.deleteEverything(); //удаление все бд
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      if (state.todoList.isNotEmpty) {
        body = TodosScreen(
          todoList: state.todoList,
          sortType: sortType,
        );
      }
      if (state.todoList.isEmpty) {
        body = const ArrowScreen();
      }

      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: onSelectedTab,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/iconSort1.svg',
                  height: 50.h,
                  color: _selectedTab == 0 ? Colors.blue : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/iconSort2.svg',
                  height: 50.h,
                  color: _selectedTab == 1 ? Colors.blue : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/iconSort3.svg',
                  height: 50.h,
                  color: _selectedTab == 2 ? Colors.blue : Colors.black,
                ),
                label: ''),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
    });
  }
}
