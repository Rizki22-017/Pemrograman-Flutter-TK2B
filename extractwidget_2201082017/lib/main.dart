import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   var faker = new Faker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("extract widget"),
        ),
        body: ListView(
          children: [
            chatitem(),
            chatitem(),
            chatitem(),
            chatitem(),
            chatitem(),
            chatitem(),
            
          ],
        )
      ),
    );
  }
}

class chatitem extends StatelessWidget {
  const chatitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("Name"),
      subtitle: Text("subtitel"),
      trailing: Text("10.00PM"),
    );
  }
}
