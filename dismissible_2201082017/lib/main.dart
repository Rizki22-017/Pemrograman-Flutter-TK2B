import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String data = "Apa kabar??";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Apa kabar?"),
                content:
                    Text("i'm fine, how about u?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        data = "im good";
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("oke"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        data = "sombong";
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("iya"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.account_tree),
      ),
    );
  }
}
