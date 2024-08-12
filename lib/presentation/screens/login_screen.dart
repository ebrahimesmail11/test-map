import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_widget.dart/custom_button.dart';
import '../widgets/auth_widget.dart/phone_from_field_section.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  late String phoneNumber;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatIsYourNumber,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        30.verticalSpace,
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          child: Text(
            AppStrings.pleaseEnterYourNumber,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }

  submit(p0) {
    if (p0!.isEmpty) {
      return 'please enter your phone number';
    } else if (p0.length < 11) {
      return 'please enter valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _phoneFormKey,
        child: ListView(
          padding: EdgeInsetsDirectional.only(
            start: 20.w,
            end: 20.w,
            top: 88.h,
            bottom: 88.h,
          ),
          children: [
            _buildIntroTexts(),
            110.verticalSpace,
            PhoneFromFieldSection(
              validator: submit,
              controller: TextEditingController(),
              onSaved: (value) {
                phoneNumber = value!;
              },
            ),
            70.verticalSpace,
            CustomButton(title: AppStrings.next, onPressed: () {
             Navigator.pushNamed(context,otpScreen);
            }),
          ],
        ),
      ),
    );
  }
}
