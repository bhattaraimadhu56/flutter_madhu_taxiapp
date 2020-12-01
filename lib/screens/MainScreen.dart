// import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatefulWidget {
  static const String idScreen = "myAppMainScreen";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Google Map Part
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Madhu Taxi App "),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            //when we use column it may overflow so that we have used
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target:
                        LatLng(-36.987750, 174.845371), // lat lan of Auckland
                    zoom: 14.4746), // just above we initialize
                mapType: MapType.normal,
                // onMapCreated: (GoogleMapController controller) {
                //   _controllerGoogleMap.complete(controller);
                //   newGoogleMapController = controller;
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
