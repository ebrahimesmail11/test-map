import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_widget.dart/custom_button.dart';
import '../widgets/auth_widget.dart/phone_from_field_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
Widget _buildIntroTexts(){
  return   Column(
    children: [
      Text(AppStrings.whatIsYourNumber,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),
      30.verticalSpace,
      Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w,),
        child: Text(AppStrings.pleaseEnterYourNumber,style: TextStyle(fontSize: 16.sp),),
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
         padding: EdgeInsetsDirectional.only(
          start: 20.w,
          end: 20.w,
          top: 88.h,  
          bottom: 88.h,
         ),
        children: [
          _buildIntroTexts(),
                110.verticalSpace,
                PhoneFromFieldSection(),
                70.verticalSpace,
                CustomButton(title: AppStrings.next, onPressed: (){}),
        ],
      ),
    );
  }
}
