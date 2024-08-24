import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:flutter_maps/helpers/location_helper.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/build_map_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  static Position? position;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static final CameraPosition _kGooglePlex = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.latitude),
    tilt: 0.0,
    zoom: 17,
  );
  Future<void> getCurrentPosition() async {
    position = await LocationHelper.determineCurrentPosition().whenComplete(() {
      setState(() {});
    });
  }
  Future <void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? BuildMapWidget(
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (controller) =>
                      _controller.complete(controller),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.primaryColor,
                  ),
                ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0,8.w , 30.h),
        child: FloatingActionButton(
          onPressed: _goToCurrentLocation,
          backgroundColor: MyColors.primaryColor,
          child: const  Icon(Icons.place, color: Colors.white,),
        ),
      ),
    );
  }
}
