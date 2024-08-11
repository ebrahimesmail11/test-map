import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constnats/my_colors.dart';

class PhoneFromField extends StatelessWidget {
  const PhoneFromField({super.key, this.controller, required this.validator, this.onSaved});
final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.primaryColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(6.r),
              ),
            ),
            child:TextFormField(
              autofocus: true,
              style: TextStyle(fontSize: 16.sp,letterSpacing: 2.sp),
              decoration: const  InputDecoration(border: InputBorder.none,),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator:  (value) {
        return validator(value);
      },
              controller: controller,
              onSaved: onSaved,
            ),
          );
  }
}