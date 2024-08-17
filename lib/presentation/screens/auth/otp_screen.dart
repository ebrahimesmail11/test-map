
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_maps/functions/show_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/auth_widget.dart/custom_button.dart';
import '../../widgets/auth_widget.dart/phone_verification_bloc.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
    final phoneNumber ;
   OtpScreen({super.key, required this.phoneNumber});
late String otpCode;
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
void _buildOtpLogin(BuildContext context) async {
  context.read<PhoneAuthCubit>().submitOtp(otpCode);
}
 
 _buildPinCodeFields(){
   final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 56.h,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.lightBlue),
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return SizedBox(
      width: 100.w,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          // listenForMultipleSmsOnAndroid: true,
          //  controller: code,
          length: 6,
          onCompleted: (value) {
            otpCode = value;
                  // logger.d(collectData.toJson());
          },
          validator: (p0) {
            return p0!.isEmpty ?'Please Enter Otp Code' : null;
          },
          //  controller: LoginBloc.otpController,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          disabledPinTheme: PinTheme(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyColors.ligthBlue,
              border: Border.all(color: MyColors.primaryColor),
            ),
          ),
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
        ),
      ),
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
         _buildPinCodeFields(),
          60.verticalSpace,
          CustomButton(title: AppStrings.verify, onPressed: () {
            showProgressIndicator(context);
            _buildOtpLogin(context);
          }),
         const  PhoneVerificationBloc(),
        ],
      ),
    );
  }
}
