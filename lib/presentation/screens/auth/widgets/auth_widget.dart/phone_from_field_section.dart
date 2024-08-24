import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maps/presentation/screens/auth/widgets/auth_widget.dart/phone_from_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'country_code_widget.dart/country_code_widget.dart';

class PhoneFromFieldSection extends StatelessWidget {
 const   PhoneFromFieldSection({super.key, required this.validator, this.controller, this.onSaved});

final Function(String?) validator;
final TextEditingController? controller;
final Function(String?)? onSaved;
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
            validator: validator,
            controller: controller,
            onSaved: onSaved,
          ) ,
        ),
      ],
    );
  }
}

