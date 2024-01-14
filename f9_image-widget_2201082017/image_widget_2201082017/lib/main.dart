import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Widget"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            //child: Image.asset(
            //  "images/spongebob1.png",
            //  ),
            child: Image(
              fit: BoxFit.cover,
              //  image: AssetImage("images/spongebob1.png"),
              image: NetworkImage("https://picsum.photos/200/300"),
            ),
          ),
        ),
      ),
    );
  }
}
