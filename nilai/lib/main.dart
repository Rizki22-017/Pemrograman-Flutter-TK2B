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
  final TextEditingController _idmahasiswaController = TextEditingController();
  final TextEditingController _idmatakuliahController = TextEditingController();
  final TextEditingController _nilaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _idmahasiswaController,
                    decoration: InputDecoration(labelText: 'ID Mahasiswa'),
                  ),
                  TextFormField(
                    controller: _idmatakuliahController,
                    decoration: InputDecoration(labelText: 'ID Matakuliah'),
                  ),
                  TextFormField(
                    controller: _nilaiController,
                    decoration: InputDecoration(labelText: 'Nilai'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // Example: Creating a new post
                      Nilai newPost = Nilai(
                        id: 0,
                        idmahasiswa: BigInt.parse(_idmahasiswaController.text),
                        idmatakuliah: BigInt.parse(_idmatakuliahController.text),
                        nilai: double.parse(_nilaiController.text),
                      );

                      Nilai createdPost = await _apiService.createNilai(newPost);

                      // Clear text fields
                      _idmahasiswaController.clear();
                      _idmatakuliahController.clear();
                      _nilaiController.clear();

                      // Refresh the UI after creating a new post
                      setState(() {});
                    },
                    child: Text('Create Post'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Nilai>>(
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
          ),
        ],
      ),
    );
  }
}
