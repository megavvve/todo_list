import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_arrow.dart';

class IfNullWidget extends StatelessWidget {
  const IfNullWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(
                width: 153.w,
                height: 115.h,
                child: Text(
                  'Looks like there is no tasks yet! Go ahead and push a plus button below',
                  style: TextStyle(color: Colors.grey, fontSize: 15.h),
                ),
              ),
              SizedBox(
                child: customArrow(3, 390),
              ),]);
  }
}