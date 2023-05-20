import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_hw2/data/database.dart';
import 'package:todo_list_hw2/presentation/pages/add_todo_screen.dart';
import 'package:todo_list_hw2/presentation/pages/info_screen.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/widgets/sorted_list.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/widgets/todo_tile.dart';

class TodosScreen extends StatefulWidget {
  final List<Todo> todoList;
  final String sortType;

  const TodosScreen(
      {super.key, required this.todoList, required this.sortType});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  bool isHideCompleted = true;
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.sp),
        ),
      ),
      builder: (context) => const AddTodoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = widget.todoList;
    List<Todo> sortedTodolist = sortedList(widget.sortType, todoList,isHideCompleted);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My tasks',
                style: TextStyle(fontSize: 34.h, fontWeight: FontWeight.bold),
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
                ),
              ),
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
                  itemCount: sortedTodolist.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      todo:  sortedTodolist[index]
                          
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
