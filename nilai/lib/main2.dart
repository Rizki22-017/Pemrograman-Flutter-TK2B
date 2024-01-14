import 'package:flutter/material.dart';
import 'package:nilai/nilai.dart';
import 'package:nilai/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: FutureBuilder<List<Nilai>>(
        future: _apiService.getNilai(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Nilai> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].idmahasiswa.toString()),
                  subtitle: Text(posts[index].idmatakuliah.toString()),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example: Creating a new post
          Nilai newPost = Nilai(id: 0, idmahasiswa: BigInt.from(2201082000), idmatakuliah: BigInt.from(112), nilai: 80);
          Nilai createdPost = await _apiService.createNilai(newPost);

          // Refresh the UI after CRUD operations
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
