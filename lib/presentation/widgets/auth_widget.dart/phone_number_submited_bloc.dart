
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/constnats/strings.dart';

import '../../../business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../../../functions/show_progress_indicator.dart';

class PhoneNumberSubmitedBloc extends StatelessWidget {
  const   PhoneNumberSubmitedBloc({super.key, required this.phoneNumber});
final  String  phoneNumber;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
         showProgressIndicator(context);
        }
        if (state is PhoneAuthSubmited) {
          Navigator.pop(context);
          Navigator. of(context).pushNamed(otpScreen,arguments: phoneNumber);
        }
        if (state is Failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg.toString()),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
       child: Container(), 
    );
  }
}