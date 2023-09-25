import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void selectAnswer() {
    print('Answer select');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          appBar: AppBar(
            title: Text('Aplikasi 3 Rizki'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Column(
            children: [
              Text('Pertanyaan Pertama'),
              ElevatedButton(
                  onPressed: () => print('Answer 1 Selected'),
                  child: Text('Answer 1')),
              ElevatedButton(
                  onPressed: () {
                    //-----------
                    print('Answer 2 Selected');
                  },
                  child: Text('Answer 2')),
              ElevatedButton(onPressed: selectAnswer, child: Text('Answer 3')),
            ],
          )),
    );
  }
}
