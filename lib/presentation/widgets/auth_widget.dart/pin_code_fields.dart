import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../constnats/my_colors.dart';

class PinCodeFields extends StatelessWidget {
  const PinCodeFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            /*   collectData.otp = value;
                  logger.d(collectData.toJson());*/
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
}
