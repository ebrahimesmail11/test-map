import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/location/location_cubit.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/presentation/screens/auth/login_screen.dart';
import 'package:flutter_maps/presentation/screens/auth/otp_screen.dart';
import 'package:flutter_maps/presentation/screens/home/map_screen.dart';

import 'constnats/strings.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: LoginScreen(),
                ));
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: OtpScreen(
                    phoneNumber: phoneNumber,
                  ),
                ));
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LocationCubit(),
            child: const MapScreen(),
          ),
        );
    }
  }
}
