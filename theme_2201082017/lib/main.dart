import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTheme(),
      theme: ThemeData(
        brightness: Brightness.light,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // visualDensity: VisualDensity.compact,
        visualDensity: VisualDensity.comfortable,
        // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
        primaryColor: Colors.amber,
        primarySwatch: Colors.grey,
        primaryColorDark: Colors.amberAccent,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: "SometypeMono"),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Theme 1",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Theme 2",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Ok"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mediation),
      ),
    );
  }
}
