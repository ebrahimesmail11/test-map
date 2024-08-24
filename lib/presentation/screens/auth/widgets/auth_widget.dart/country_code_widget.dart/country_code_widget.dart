
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constnats/my_colors.dart';

class CountryCodeWidget extends StatelessWidget {
  const CountryCodeWidget({
    super.key,
  });
  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),);
    return flag;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.ligthGrey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: Text(
         generateCountryFlag() + ' +20',
        style: TextStyle(fontSize: 16.sp,letterSpacing: 2.sp),
      ),
    );
  }
}