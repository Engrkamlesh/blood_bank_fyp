import 'dart:async';
import 'package:blood_bank_fyp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google_Map extends StatefulWidget {
  const Google_Map({super.key});

  @override
  State<Google_Map> createState() => _Google_MapState();
}

class _Google_MapState extends State<Google_Map> {
  Completer<GoogleMapController> _controller = Completer();


// static const LatLng  _sourceLocation = LatLng(25.5065, 69.0136);
// static const LatLng _destination = LatLng(25.51086512844841, 68.99054131822115);
  final Set<Marker>  _marker = {};
  final Set<Polyline> _polyline = {};
// ignore: prefer_final_fields
  List<LatLng> _coordinate = [
    LatLng(25.5065, 69.0136),
    LatLng(25.51086512844841, 68.99054131822115)
  ];

  @override
  void initState() {
    super.initState();

    for(int i=0; i<_coordinate.length; i++){
      _marker.add(
          Marker(
              markerId: MarkerId('1'),
              position: _coordinate[i],
              infoWindow: InfoWindow(
                  title: 'Current Location',
                  snippet: '5 Star'
              ),
              icon: BitmapDescriptor.defaultMarker
          )
      );
      setState(() {

      });
      _polyline.add(
          Polyline(polylineId: PolylineId('1'),
              points: _coordinate,
              color: Colors.deepOrange,
              width: 4
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Map',
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: AppColor.btxtColor, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.greColor,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target:LatLng(25.5065, 69.0136),zoom: 14),
        markers: _marker,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

      ),
    );
  }
}