import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'for_custom_arrow.dart';




class CustomArrow extends StatelessWidget {
  final double thickness;
  final double height;

  const CustomArrow(this.thickness, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height * 0.4.w,
      height: height,
      child: CustomPaint(
        painter: ForCustomArrow(thickness),
      ),
    );
  }
}






