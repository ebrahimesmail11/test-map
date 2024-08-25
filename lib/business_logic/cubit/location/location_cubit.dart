import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Position? position;
  final Completer<GoogleMapController> kController = Completer<GoogleMapController>();

  Future<void> checkLocationPermissions() async {
    emit(LocationLoading());
    LocationPermission permission;

    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(LocationError(errorMsg: 'Location services are disabled. Please enable them in the device settings.'));
      return;
    }

    // Check the current location permissions state
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // If permissions are denied, request permissions
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationError(errorMsg: 'Location permissions are denied'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      emit(LocationError(errorMsg: 'Location permissions are permanently denied, we cannot request permissions.'));
      return;
    }

    // If permissions are granted, proceed to access the location
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      // Permissions granted, fetch location
      await determineCurrentPosition();
    }
  }

  Future<void> determineCurrentPosition() async {
    try {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      emit(LocationSuccess(position!));
    } catch (e) {
      emit(LocationError(errorMsg: 'Error fetching location: $e'));
    }
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController controller = await kController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(googlePlex()));
  }

  CameraPosition googlePlex() {
    if (position != null) {
      return CameraPosition(
        bearing: 0.0,
        target: LatLng(position!.latitude, position!.longitude), // Fixed: use longitude for target
        tilt: 0.0,
        zoom: 17,
      );
    }
    return  CameraPosition(target: LatLng(0, 0), zoom: 0); // Fallback in case position is null
  }
}