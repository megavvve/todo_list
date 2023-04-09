import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_hw2/presentation/pages/add_todo_screen.dart';
import 'package:todo_list_hw2/presentation/pages/info_screen.dart';
import 'package:todo_list_hw2/presentation/pages/main_screen/widgets/custom_arrow.dart';

class ArrowScreen extends StatelessWidget {
  const ArrowScreen({super.key});
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp))),
        builder: (context) => const AddTodoScreen());
  }

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 70.w,
              ),
            ],
          ),
          SizedBox(
            height: 41.h,
          ),
          Container(width:153.w ,height:115.h ,child: Text("Looks like there is no tasks yet! Go ahead and push a plus button below",style: TextStyle(fontSize: 15.sp,color: Colors.grey),),),
          CustomArrow(3.sp, 350.h),
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
