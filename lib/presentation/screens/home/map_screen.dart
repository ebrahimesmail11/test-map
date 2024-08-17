import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_maps/presentation/widgets/auth_widget.dart/custom_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit=PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: Container(
          color: Colors.white,
          child: CustomButton(title: "Sign out", onPressed: () {
             phoneAuthCubit.signOut();
           Navigator.of(context).pushReplacementNamed(loginScreen);
          }),
        ),
      ),
    );
  }
}
