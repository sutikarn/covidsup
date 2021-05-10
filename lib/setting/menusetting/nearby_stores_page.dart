import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NearbyStoresPage extends StatefulWidget {
  @override
  _NearbyStoresPageState createState() => _NearbyStoresPageState();
}

class _NearbyStoresPageState extends State<NearbyStoresPage> {
  Marker markers;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  List<Marker> listMarker = [];

  @override
  void initState() {
    super.initState();
    _currentLocation();
    print('initstate');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    var googleMap = GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(currentLocation?.latitude ?? 13.7567046,
            currentLocation?.longitude ?? 100.499701),
        zoom: 16,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onLongPress: (latlang) {
        print('longpress');
        _makeMarker(
            latlang); //we will call this function when pressed on the map
      },
      markers: Set<Marker>.of(listMarker),
    );
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.pink[200],
//        title: Row(
//          children: [
//            InkWell(
//              onTap: () async {
//
//              },
//              child: Image.network(
//                'https://i.pinimg.com/originals/e0/64/7c/e0647cc674cd2860e69ff9583eba3671.jpg',
//                width: 50,
//                height: 35,
//              ),
//            ),
//            Text('Map')
//          ],
//        ),
//        actions: [
//          IconButton(
//              icon: Icon(Icons.my_location), onPressed: _currentLocation),
//        ],
//      ),
      body: Stack(
        children: [
          googleMap,
          Positioned(
            top: kToolbarHeight,
            left: 50,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Image.asset('assets/icons/arrow_back_colorblack.png',color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _makeMarker(LatLng latlang) async {
    setState(() {
      Marker marker = Marker(
        markerId: MarkerId(listMarker.length.toString()),
        draggable: true,
        position:
            latlang, //With this parameter you automatically obtain latitude and longitude
        infoWindow: InfoWindow(
          title: "Marker here ${listMarker.length} ",
          snippet: 'This looks good',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
      listMarker.add(marker);
    });
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    var location = new Location();
    try {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 17.0,
        ),
      ));
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }
}
