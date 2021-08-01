import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Position currentPosition;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Position currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white.withOpacity(0),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 60, 100, 5),
                  alignment: Alignment.bottomLeft,
                  color: Theme.of(context).accentColor,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.qr_code,
                    size: 26,
                  ),
                  title: Text(
                    'My QR',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.money,
                    size: 26,
                  ),
                  title: Text(
                    'Bookings',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.car_rental,
                    size: 26,
                  ),
                  title: Text(
                    'My Vehicles',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_city,
                    size: 26,
                  ),
                  title: Text(
                    'My Addresses',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet_giftcard,
                    size: 26,
                  ),
                  title: Text(
                    'Refer and earn',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.card_membership,
                    size: 26,
                  ),
                  title: Text(
                    'Check Challan',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                    size: 26,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  title: Text('Logout',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            locatePosition();
          },
        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add), title: Text('Add Address')),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_parking), title: Text('Parking')),
            BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services),
                title: Text('Services'))
          ],
        ));
  }
}
