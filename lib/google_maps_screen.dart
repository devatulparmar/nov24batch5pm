import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late GoogleMapController mapController;
  final String googleAPiKey = "AIzaSyCNL1m7LXmi06sKKMQAfER1KRIfauw3mtE";
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  var originLatitude = 22.3091724, originLongitude = 73.1710888; // Vadodara
  var destLatitude = 23.0204741, destLongitude = 72.4149272; // Ahmedabad

  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  Future _getPolyline() async {
    PolylineResult resultPoly = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleAPiKey,
      request: PolylineRequest(
        origin: PointLatLng(originLatitude, originLongitude),
        destination: PointLatLng(destLatitude, destLongitude),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Vadodara")],
      ),
    );
    print('points:: ${resultPoly.points}');

    if (resultPoly.points.isNotEmpty) {
      for (var point in resultPoly.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    addPolyLinesToMap();
  }


  Location location = Location();

  bool isServiceEnabled = false;
  late PermissionStatus permissionGranted;
  late LocationData _locationData;

  Future _getLocation() async {
    print(permissionGranted);
    if (permissionGranted == PermissionStatus.deniedForever) {
      AppSettings.openAppSettings(type: AppSettingsType.settings);
    } else {
      var obj = await location.getLocation();
      _locationData = obj;
     await mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0),
            zoom: 11,
          ),
        ),
      );
    }
  }

  Future _checkLocationServiceEnable() async {
    /// this function will call to check location is On/Off

    isServiceEnabled = await location.serviceEnabled();
    if (isServiceEnabled == false) {
      isServiceEnabled = await location.requestService();
      if (isServiceEnabled == false) {
        return;
      }
    }
  }

  Future _checkLocationPermissionGranted() async {
    /// this function will call to check user give permission to access location

    permissionGranted = await location.hasPermission();
    print(permissionGranted);
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

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

  void addPolyLinesToMap() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      width: 5,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _checkLocationServiceEnable();
    _checkLocationPermissionGranted();

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

    _getPolyline();
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
        polylines: Set.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          setState(() {});
        },
        // padding: EdgeInsets.all(80),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getLocation();
        },
        child: const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
      ),
    );
  }
}
