import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Apps"),
        ),
        body: Center(
          child: Text(
            "Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo Haloo ",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amber,
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontFamily: 'TiltNeon',
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
              decorationThickness: 2,
            ),
          ),
        ),
      ),
    );
  }
}
