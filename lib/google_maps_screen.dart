import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late GoogleMapController mapController;
  final String googleAPiKey = "AIzaSyCNL1m7LXmi06sKKMQAfER1KRIfauw3mtE";
  Map<MarkerId, Marker> markers = {};
  var originLatitude = 22.3091724, originLongitude = 73.1710888; // Vadodara
  var destLatitude = 23.0204741, destLongitude = 72.4149272; // Ahmedabad

  void addMarkerToMap(
      {required LatLng position,
      required String id,
      required BitmapDescriptor descriptor}) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    /// origin marker
    addMarkerToMap(
      id: "origin",
      position: LatLng(originLatitude, originLongitude),
      descriptor: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    /// destination marker
    addMarkerToMap(
      id: "destination",
      position: LatLng(destLatitude, destLongitude),
      descriptor: BitmapDescriptor.defaultMarker,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Screen"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.3072, 73.1812),
          zoom: 11,
        ),
        onLongPress: (value) {
          print(value);
        },
        onTap: (latLong) {
          print(latLong);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,
        // liteModeEnabled: true,
        indoorViewEnabled: true,
        fortyFiveDegreeImageryEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        buildingsEnabled: true,
        trafficEnabled: true,
        markers: Set.of(markers.values),
        // padding: EdgeInsets.all(80),
      ),
    );
  }
}
