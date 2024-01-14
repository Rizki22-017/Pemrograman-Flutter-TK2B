import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Budjank",
      "Age": 17,
      "favColor": [
        "Black",
        "Green",
        "Red",
        "Black",
        "Green",
        "Red",
        "Black",
        "Green",
        "Red",
        "Black",
        "Green",
        "Red",
      ]
    },
    {
      "Name": "Rizki",
      "Age": 21,
      "favColor": ["Black", "Blue", "White"]
    },
    {
      "Name": "ALi",
      "Age": 20,
      "favColor": [
        "Pink",
        "Blue",
        "White",
        "Red",
        "Black",
        "Green",
        "Red",
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Mapping List"),
          ),
        ),
        body: ListView(
          children: myList.map((data) {
            print(data['favColor']);
            List myFavColor = data['favColor'];
            return Card(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 142, 175, 140).withOpacity(0.7),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name: ${data['Name']}"),
                              Text("Age: ${data['Age']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: myFavColor.map((color) {
                          return Container(
                            color: Color.fromARGB(255, 15, 237, 7),
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
