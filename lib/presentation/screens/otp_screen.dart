import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_widget.dart/custom_button.dart';
import '../widgets/auth_widget.dart/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {

  const OtpScreen({super.key});
   final phoneNumber ='';
  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.verifyYourNumber,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        30.verticalSpace,
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 1.w,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.enterYour6DigitCode,
                  style: TextStyle(
                      fontSize: 16.sp, color: Colors.black, height: 1.4.h),
                  children:<TextSpan> [
                    TextSpan(
                      text: '$phoneNumber',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: 20.w,
          end: 20.w,
          top: 88.h,
          bottom: 88.h,
        ),
        children: [
          _buildIntroTexts(),
          88.verticalSpace,
          const PinCodeFields(),
          60.verticalSpace,
          CustomButton(title: AppStrings.verify, onPressed: () {}),
        ],
      ),
    );
  }
}
