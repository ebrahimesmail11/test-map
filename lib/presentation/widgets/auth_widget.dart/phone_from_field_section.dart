import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maps/presentation/widgets/auth_widget.dart/phone_from_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'country_code_widget.dart/country_code_widget.dart';

// ignore: must_be_immutable
class PhoneFromFieldSection extends StatelessWidget {
   PhoneFromFieldSection({super.key});
late String phoneNumber;
 submit(p0){
 if(p0!.isEmpty){
              return 'please enter your phone number';
            }else if (p0.length < 11) {
              return 'please enter valid phone number';
            }
            return null;
}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const   Expanded(
          flex: 1,
          child: CountryCodeWidget(),
        ),
        16.horizontalSpace,
        Expanded(
          flex: 2,
          child: PhoneFromField(
            validator: submit,
            controller: TextEditingController(),
            onSaved: (value){
              phoneNumber=value!;
            },
          ) ,
        ),
      ],
    );
  }
}

