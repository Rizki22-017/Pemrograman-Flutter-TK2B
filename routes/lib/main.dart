import 'package:flutter/material.dart';
import './pages/dua.dart';
import './pages/tiga.dart';
import './pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      initialRoute: Home.routesName,
      routes: {
        Home.routesName: (context) => Home(),
        BagianDua.routesName: (context) => BagianDua(),
        BagianTiga.routesName: (context) => BagianTiga()
      },
    );
  }
}
