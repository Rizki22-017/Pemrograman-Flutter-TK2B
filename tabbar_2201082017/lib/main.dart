import 'package:flutter/material.dart';

void main() {
  runApp(MyTabBar());
}

class MyTabBar extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      text: "Work",
      icon: Icon(Icons.card_travel),
    ),
    Tab(
      text: "Call",
      icon: Icon(Icons.phone),
    ),
    Tab(
      text: "person",
      icon: Icon(Icons.person),
    ),
    Tab(
      text: "Consume",
      icon: Icon(Icons.add_to_photos),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 3,
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Bar"),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.purple,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              indicatorColor: Colors.purple,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              indicator: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.purple),
              ),
              unselectedLabelColor: Colors.white,
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Work"),
              ),
              Center(
                child: Text("Call"),
              ),
              Center(
                child: Text("Person"),
              ),
              Center(
                child: Text("Consume"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
