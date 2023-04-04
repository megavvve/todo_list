import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customArrow.dart';

class IfNullWidget extends StatelessWidget {
  const IfNullWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [SizedBox(
                  width: 153.w,
                  height: 115.h,
                  child: Text(
                    'Looks like there is no tasks yet! Go ahead and push a plus button below',
                    style: TextStyle(color: Colors.grey, fontSize: 15.h),
                  ),
                ),
                SizedBox(
                  // height: 370.h,
                  child: customArrow(3, 390),
                ),]),
    );
  }
}