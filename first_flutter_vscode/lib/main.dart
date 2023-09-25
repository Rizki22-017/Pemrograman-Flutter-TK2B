import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HalHello(),
    ),
  );
}

class HalHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          width: 200.0,
          height: 210.0,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Hello World",
                  style: TextStyle(
                      fontFamily: "helvetica",
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                Text(
                  "RIZKI",
                  style: TextStyle(
                      fontFamily: "Times New Romans",
                      fontSize: 20.0,
                      color: Colors.green),
                ),
                Text(
                  "2201082017",
                  style: TextStyle(
                      fontFamily: "Calibri",
                      fontSize: 20.0,
                      color: Colors.orange),
                ),
                Text(
                  "D3-Teknik Komputer",
                  style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 20.0,
                      color: Colors.purple),
                ),
                Text(
                  "Teknologi Informasi",
                  style: TextStyle(
                      fontFamily: "Agency", fontSize: 20.0, color: Colors.red),
                ),
                Text(
                  "Padang",
                  style: TextStyle(
                      fontFamily: "Candara",
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
