import 'package:drawer_2201082017/homepage.dart';
import 'package:drawer_2201082017/settingpage.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            color: Colors.green,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(MyHome.routesName);
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(SettingPage.routesName);
            },
            leading: Icon(Icons.settings),
            title: Text("Setting"),
          ),
        ],
      ),
    );
  }
}
