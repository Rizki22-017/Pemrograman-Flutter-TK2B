import 'package:flutter/material.dart';

void main() {
  runApp(MyTextField());
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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
          child: Center(
            child: TextField(
              autocorrect: true,

              decoration: InputDecoration(
                icon: Icon(Icons.numbers_sharp),
                labelText: "NO BP: ",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),

              // autofocus: false,
              enableInteractiveSelection: true,
              // obscureText: true,
              showCursor: true,
              cursorOpacityAnimates: true,
              cursorColor: Colors.red,
              // cursorWidth: 5,
              // cursorHeight: 30,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.characters,

              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
