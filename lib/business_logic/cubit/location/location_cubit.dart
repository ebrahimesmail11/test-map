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

    // Check if location services are enabled
    if (!await Geolocator.isLocationServiceEnabled()) {
      emit(LocationError(
        errorMsg: 'Location services are disabled. Please enable them in the device settings.',
      ));
      return;
    }

    // Check the current location permission state
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // If permissions are denied, request permissions
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        emit(LocationError(errorMsg: 'Location permissions are denied.'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      emit(LocationError(
        errorMsg: 'Location permissions are permanently denied. Please enable them from the device settings.',
      ));
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
      /// fixed to error 'User denied permissions to access the device\'s location.
    //   bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // if(!isServiceEnabled){
    //   await Geolocator.requestPermission();
    // }
     await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
       emit(LocationSuccess(position!));

     
    } catch (e) {
      if (e is PermissionDeniedException) {
        emit(LocationError(errorMsg: 'User denied permissions to access the device\'s location.'));
      } else {
        emit(LocationError(errorMsg: 'Error fetching location: $e'));
      }
    }
  }

  Future<void> goToCurrentLocation() async {
    if (position == null) {
      emit(LocationError(errorMsg: 'Current location is not available.'));
      return;
    }

    final GoogleMapController controller = await kController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(googlePlex()));
  }

  CameraPosition googlePlex() {
    return position != null
        ? CameraPosition(
            bearing: 0.0,
            target: LatLng(position!.latitude, position!.longitude),
            tilt: 0.0,
            zoom: 17,
          )
        : CameraPosition(
            target: LatLng(0, 0), // Default position if location is not available
            zoom: 0,
          );
  }
 
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// part 'location_state.dart';

// class LocationCubit extends Cubit<LocationState> {
//   LocationCubit() : super(LocationInitial());

//   Position? position;
//   final Completer<GoogleMapController> kController = Completer<GoogleMapController>();

//   Future<void> checkLocationPermissions() async {
//     emit(LocationLoading());

//     // Check if location services are enabled
//     if (!await Geolocator.isLocationServiceEnabled()) {
//       emit(LocationError(
//         errorMsg: 'Location services are disabled. Please enable them in the device settings.',
//       ));
//       return;
//     }

//     // Check the current location permission state
//     LocationPermission permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       // If permissions are denied, request permissions
//       permission = await Geolocator.requestPermission();

//       if (permission == LocationPermission.denied) {
//         emit(LocationError(errorMsg: 'Location permissions are denied.'));
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately
//       emit(LocationError(
//         errorMsg: 'Location permissions are permanently denied. Please enable them from the device settings.',
//       ));
//       return;
//     }

//     // If permissions are granted, proceed to access the location
//     if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
//       // Permissions granted, fetch location
//       await determineCurrentPosition();
//     }
//   }

//   Future<void> determineCurrentPosition() async {
//     try {
//       // Check if location services are enabled again before fetching the location
//       if (!await Geolocator.isLocationServiceEnabled()) {
//         emit(LocationError(
//           errorMsg: 'Location services are disabled. Please enable them in the device settings.',
//         ));
//         return;
//       }

//       position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       // Emit success state with the fetched position
//       emit(LocationSuccess(position!));

//     } catch (e) {
//       if (e is PermissionDeniedException) {
//         emit(LocationError(errorMsg: 'User denied permissions to access the device\'s location.'));
//       } else if (e is LocationServiceDisabledException) {
//         emit(LocationError(errorMsg: 'Location services are disabled.'));
//       } else {
//         emit(LocationError(errorMsg: 'Error fetching location: $e'));
//       }
//     }
//   }

//   Future<void> goToCurrentLocation() async {
//     if (position == null) {
//       emit(LocationError(errorMsg: 'Current location is not available.'));
//       return;
//     }

//     final GoogleMapController controller = await kController.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(googlePlex()));
//   }

//   CameraPosition googlePlex() {
//     return position != null
//         ? CameraPosition(
//             bearing: 0.0,
//             target: LatLng(position!.latitude, position!.longitude),
//             tilt: 0.0,
//             zoom: 17,
//           )
//         : CameraPosition(
//             target: LatLng(0, 0), // Default position if location is not available
//             zoom: 0,
//           );
//   }
// }