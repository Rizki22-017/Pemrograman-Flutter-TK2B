import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var question = ['Apa warna kesukaan kamu?', 'Apa makanan kesukaan kamu?'];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void selectAnswer() {
    setState(() {
      if (questionIndex < question.length - 1) {
        questionIndex = questionIndex + 1;
      } else {
        questionIndex = 0;
      }
    });

    print(questionIndex);
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
              Text(question[questionIndex]),
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
