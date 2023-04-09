import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_hw2/data/repository/data/local/database/database.dart';
import 'package:todo_list_hw2/presentation/pages/add_todo_screen.dart';
import 'package:todo_list_hw2/presentation/pages/info_screen.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/widgets/todo_tile.dart';

class TodosScreen extends StatefulWidget {
  final List<Todo> todoList;
  final String sortType;

  TodosScreen({super.key, required this.todoList, required this.sortType});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

bool isHideCompleted = true;

class _TodosScreenState extends State<TodosScreen> {
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
    List<Todo> todoList = widget.todoList;
    String sortType = widget.sortType;
    
    List<Todo> todoListNew = isHideCompleted
        ? todoList
        : todoList.where((x) => x.isDone == false).toList();
    var sortedTodolist;
    if (sortType == "sortAlphabetically") {
      sortedTodolist = List<Todo>.from(todoListNew)
        ..sort((a, b) => a.name.compareTo(b.name));
    }
    if (sortType == "sortAlphabeticallyInReverseOrder") {
      sortedTodolist = (List<Todo>.from(todoListNew)
            ..sort((a, b) => a.name.compareTo(b.name)))
          .reversed
          .toList();
    }
    if (sortType == "sortingByCreationDate") {
      sortedTodolist = (List<Todo>.from(todoListNew)
            ..sort((a, b) {
              final dateComparison = a.date.compareTo(b.date);
              if (dateComparison != 0) {
                return dateComparison;
              }
              return a.time.compareTo(b.time);
            }))
          .reversed
          .toList();
    }
    return Container(
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
                style: TextStyle(fontSize: 34.h, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 70.w,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isHideCompleted = !isHideCompleted;
                    });
                  },
                  child: Text(
                    (isHideCompleted) ? "Show completed" : "Hide completed",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13.sp,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 41.h,
          ),
          Column(
            children: [
              SizedBox(
                height: 450.h,
                child: ListView.builder(
                  itemCount: todoListNew.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      todo: (sortedTodolist != null)
                          ? sortedTodolist[index]
                          : todoList[index],
                    );
                  },
                ),
              ),
            ],
          ),
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
                  child: SvgPicture.asset(
                    'assets/icons/iconInfo.svg',
                    height: 40.h,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _addTask(context);
                  },
                  tooltip: 'Add ToDo',
                  child: Icon(
                    Icons.add,
                    size: 40.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
