import 'package:flutter/material.dart';
import 'package:matakuliah/Matakuliah.dart';
import 'package:matakuliah/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Example'),
      ),
      body: FutureBuilder<List<Matakuliah>>(
        future: _apiService.getMatakuliah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Matakuliah> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].nama),
                  subtitle: Text(posts[index].kode),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example: Creating a new post
          Matakuliah newPost = Matakuliah(id: 1, nama: 'Pemrograman Mobile', kode: 'TK11', sks: 4);
          Matakuliah createdPost = await _apiService.createMatakuliah(newPost);

          // Refresh the UI after CRUD operations
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
