import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildMapWidget extends StatelessWidget {
  const BuildMapWidget({super.key, this.onMapCreated, required this.initialCameraPosition, });
final void Function(GoogleMapController)? onMapCreated;
final CameraPosition initialCameraPosition;
  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      initialCameraPosition: initialCameraPosition,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated:onMapCreated ,
    );
  }
}