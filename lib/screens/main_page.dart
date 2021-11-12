// ignore: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laffah/constant/app_colors.dart';
import 'package:laffah/kf_drawer.dart';
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

class MainPage extends KFDrawerContent {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  Location currentLocation = Location();
  // BitmapDescriptor _bitmapDescriptor;
  final Set<Marker> _markers = {};

  /*void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _location.onLocationChanged.listen((event) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude, event.longitude), zoom: 15),
        ),
      );
    });
  }*/

  /* void _currentLocation(GoogleMapController mapController) async {
    final GoogleMapController controller = mapController;
    LocationData? currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation!.latitude, currentLocation.longitude),
        zoom: 15.0,
      ),
    ));
  }*/

  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
    });
  }


  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        icon:BitmapDescriptor.fromAsset("assets/images/ic_pin.png"),));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _markers.add(Marker(
    //     markerId: MarkerId("1"),
    //     position: const LatLng(41.40442592799307, 2.1761136771317475),
    //     infoWindow: const InfoWindow(title: "La Sagrada Familia"),
    //     icon: _bitmapDescriptor,
    // ),);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialcameraposition, zoom: 12.0),
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: (controller) {
              _controller = controller;
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: _markers,
          ),
          Container(
            height: 20.h,
            width: 20.w,
            margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.w),
            child: IconButton(
              onPressed: widget.onMenuPressed,
              icon: Image.asset("assets/images/ic_burger.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                getLocation();
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4.h, vertical: 12.w),
                child: Image.asset(
                  "assets/images/ic_target.png",
                  height: 20.0,
                  width: 20.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.rideButtonColor,
                  borderRadius: BorderRadius.circular(100.0)),
              height: 14.h,
              width: 30.w,
              margin: EdgeInsets.symmetric(horizontal: 4.h, vertical: 12.w),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "RIDE",
                  style: TextStyle(
                      fontSize: 18.0, letterSpacing: 10.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
