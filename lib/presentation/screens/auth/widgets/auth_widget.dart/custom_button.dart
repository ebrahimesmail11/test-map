import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, this.onPressed, this.child});
  final String title;
  final Widget? child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 85.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black,minimumSize: Size(110.w, 50.h),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r))),
          child: child ?? Text(title,style: TextStyle(fontSize: 16.sp,color: Colors.white),),
        ),
      ),
    );
  }
}