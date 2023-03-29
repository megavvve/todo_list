import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_hw2/widgets/customArrow.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
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
          SizedBox(
            width: 153.w,
            height: 115.h,
            child: Text(
              'Looks like there is no tasks yet! Go ahead and push a plus button below',
              style: TextStyle(color: Colors.grey, fontSize: 15.h),
            ),
          ),
          SizedBox(
           // height: 370.h,
            child:  customArrow(3, 390),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Info',
                  child: Icon(
                    Icons.info_rounded,
                    size: 42.h,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
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
    );
  }
}
