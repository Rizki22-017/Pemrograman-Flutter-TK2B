import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainMediaQuery = MediaQuery.of(context).size.height;
    final appBAr = AppBar(
      title: Text("Media Query"),
    );
    final bodyMediaQuery = mainMediaQuery -
        MediaQuery.of(context).padding.top -
        appBAr.preferredSize.height;

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: appBAr,
      body: (isLandscape)
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  height: bodyMediaQuery * 0.5,
                  color: Colors.black12,
                ),
                Container(
                  height: bodyMediaQuery * 0.5,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Container(
                          child: Text("Muhammad Irfan"),
                          color: Color.fromARGB(
                            255,
                            Random().nextInt(255),
                            Random().nextInt(255),
                            Random().nextInt(255),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  height: bodyMediaQuery * 0.3,
                  color: Colors.black12,
                ),
                Container(
                  height: bodyMediaQuery * 0.7,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text("Muhammad Irfan"),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
