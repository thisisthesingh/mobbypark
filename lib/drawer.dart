import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Name',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
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
              'Meals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.money,
              size: 26,
            ),
            title: Text(
              'Bookings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.car_rental,
              size: 26,
            ),
            title: Text(
              'My Vehicles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_city,
              size: 26,
            ),
            title: Text(
              'My Addresses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.wallet_giftcard,
              size: 26,
            ),
            title: Text(
              'Refer and earn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.card_membership,
              size: 26,
            ),
            title: Text(
              'Check Challan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 50,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 26,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
