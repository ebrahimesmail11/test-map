

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/location/location_cubit.dart';

import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constnats/my_colors.dart';

import 'package:flutter_maps/presentation/screens/home/widgets/build_map_widget.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/floating_search_app_bar.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/my_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  void initState() {
    super.initState();
   context.read<LocationCubit>().determineCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer:   MyDrawer(),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return state is Loading? const   Center(child: CircularProgressIndicator(color: MyColors.primaryColor,)): state is LocationError? Center(child: Text(state.errorMsg.toString())): Stack(
            fit: StackFit.expand,
            children: [
              BuildMapWidget(
                initialCameraPosition: context.read<LocationCubit>().googlePlex(),
                onMapCreated: (controller) => context.read<LocationCubit>().kController.complete(controller),
              ),
                FloatingSearchAppBar( controller: context.read<LocationCubit>().controller,),
            ]
           );
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8.w, 30.h),
        child: FloatingActionButton(
          onPressed: context.read<LocationCubit>().goToCurrentLocation,
          backgroundColor: MyColors.primaryColor,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
