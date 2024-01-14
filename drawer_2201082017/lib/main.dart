import 'package:drawer_2201082017/homepage.dart';
import 'package:drawer_2201082017/settingpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      routes: {
        MyHome.routesName: (context) => MyHome(),
        SettingPage.routesName: (context) => SettingPage(),
      },
    );
  }
}
