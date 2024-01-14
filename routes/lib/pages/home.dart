import 'package:flutter/material.dart';
import 'package:routes/pages/dua.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routesName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(BagianDua.routesName);
        },
        child: Center(
          child: Text("Haii"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
