import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String data = "Halooo";

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
                title: Text("Selamat Pagi"),
                content:
                    Text("Ucapkan selamat"),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        data = "Selamatt";
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("Morning"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        data = "Haiii";
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("Iyaa?"),
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
