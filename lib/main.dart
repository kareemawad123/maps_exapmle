import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MapSample(),
    );
  }
}
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

   CameraPosition _initialPosition =  CameraPosition(
    target: LatLng(26.8206, 30.8025),
    zoom: 6,
     bearing: 6,
     tilt: 6,
  );

   static const Marker _adidasSelected =  Marker(
     markerId: MarkerId('_selectedMarker'),
     infoWindow: InfoWindow(title: 'Adidas'),
     icon: BitmapDescriptor.defaultMarker,
     position: LatLng(29.976480, 31.131302),
   );
  static const Marker _adidasSelected2 =  Marker(
    markerId: MarkerId('_selectedMarker'),
    infoWindow: InfoWindow(title: 'Adidas'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(29.976600, 31.131333),
  );


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          //controller.moveCamera(cameraUpdate)
        },
        markers: {
          _adidasSelected,
          _adidasSelected2,
        },
      ),

    );
  }

}