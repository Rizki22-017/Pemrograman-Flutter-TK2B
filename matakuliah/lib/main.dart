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
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _sksController = TextEditingController();

  int idMatakuliah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Id data : $idMatakuliah"),
                  TextFormField(
                    controller: _kodeController,
                    decoration: const InputDecoration(labelText: 'Kode'),
                  ),
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _sksController,
                    decoration: const InputDecoration(labelText: 'SKS'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Example: Creating a new post
                          Matakuliah newPost = Matakuliah(
                            id: 0,
                            kode: _kodeController.text,
                            nama: _namaController.text,
                            sks: int.tryParse(_sksController.text) ?? 0,
                          );
                          Matakuliah createdPost =
                              await _apiService.createMatakuliah(newPost);

                          // Clear text fields
                          _kodeController.clear();
                          _namaController.clear();
                          _sksController.clear();

                          // Refresh the UI after creating a new post
                          setState(() {});
                        },
                        child: const Text('Create Post'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Clear text fields
                          _namaController.clear();
                          _kodeController.clear();
                          _sksController.clear();
                          setState(() {
                            idMatakuliah = 0;
                          });
                        },
                        child: const Text('Clear Post'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Matakuliah editPost = Matakuliah(
                            id: idMatakuliah,
                            kode: _kodeController.text,
                            nama: _namaController.text,
                            sks: int.tryParse(_sksController.text) ?? 0,
                          );


                          print(_namaController.text);

                          // Cetak log untuk memeriksa apakah data yang diperbarui benar-benar dikirim ke server
                          // print("Updating post: ${editPost.id}");

                          // Cetak log untuk memeriksa apakah pembaruan berhasil
                          print("Post updated successfully");

                          setState(() {
                            idMatakuliah = 0;
                          });

                          _kodeController.clear();
                          _namaController.clear();
                          _sksController.clear();

                          Matakuliah editedPost =
                              await _apiService.updateMatakuliah(editPost);

                          // Fetch updated data from the server
                          await _apiService.getMatakuliah();
                        },
                        child: const Text('Edit Post'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder<List<Matakuliah>>(
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
                          trailing: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red),
                            ),
                            onPressed: () async {
                              _apiService.deleteMatakuliah(posts[index].id);
                              _apiService.getMatakuliah();
                              setState(() {});
                            },
                            child: const Text('Delete'),
                          ),
                          onTap: () async {
                            Matakuliah selectedMatakuliah = await _apiService
                                .getMatakuliahById(posts[index].id);

                            // Set the controller values with the selected Matakuliah's data
                            idMatakuliah = selectedMatakuliah.id;
                            _kodeController.text = selectedMatakuliah.kode;
                            _namaController.text = selectedMatakuliah.nama;
                            _sksController.text = selectedMatakuliah.sks.toString();

                            _apiService.getMatakuliah();

                            setState(() {
                              idMatakuliah = selectedMatakuliah.id;
                              print(idMatakuliah);
                            });

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Update(
                            //           selectedMahasiswa.id,
                            //           selectedMahasiswa.nama,
                            //           selectedMahasiswa.email,
                            //           selectedMahasiswa.tgllahir),
                            //     ));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
