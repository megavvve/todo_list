import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(27.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Information',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 334.w,
              height: 493.h,
              child: Text(
                'Praesent ultricies lacus in ligula volutpat feugiat. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Fusce luctus justo eget nisi hendrerit, quis aliquam arcu porta. Cras ultricies, elit sit amet cursus consectetur, risus felis ullamcorper nulla, ut scelerisque sapien lorem non sem. Integer vestibulum ornare ligula, a placerat lectus volutpat ultrices. Aliquam commodo malesuada purus a mollis. Vestibulum pulvinar aliquam libero eu consequat.\n\nCras massa orci, ultrices sed scelerisque id, semper vel neque. Proin a turpis quis nibh cursus hendrerit sit amet vel libero. Nullam sit amet laoreet ante. Mauris sit amet mi vitae arcu dignissim porttitor et in arcu. Nullam eleifend molestie arcu, pretium fermentum orci feugiat eget. Integer dapibus tincidunt ipsum, at rutrum magna rutrum at. Quisque pretium convallis vestibulum.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  height: 1.2.sp,
                ),
              ),
            ),
            SizedBox(
              height: 106.h,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 316.w,
                height: 46.h,
                color: Colors.black,
                child: Center(
                    child: Text(
                  'Got it!',
                  style: TextStyle(fontSize: 14.h),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
