import 'package:flutter/material.dart';

void main() {
  runApp(MyTextField());
}

class MyTextField extends StatefulWidget {
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String nama = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TextField"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    nama = value;
                  });
                },
              ),
              Text("Nama: $nama")
            ],
          ),
        ),
      ),
    );
  }
}
