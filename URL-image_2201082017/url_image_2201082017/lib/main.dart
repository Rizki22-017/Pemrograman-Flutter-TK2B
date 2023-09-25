import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Aplikasi 1 Rizki'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/SpongeBob_SquarePants_character.svg/1200px-SpongeBob_SquarePants_character.svg.png'),
          ),
        ),
      ),
    );
  }
}
