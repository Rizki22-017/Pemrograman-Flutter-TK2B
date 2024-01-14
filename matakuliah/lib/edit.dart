import 'package:flutter/material.dart';
import 'package:matakuliah/Matakuliah.dart';
import 'package:matakuliah/api.dart';

class Update extends StatefulWidget {
  final int id;
  final String kode;
  final String nama;
  final int sks;

  const Update(this.id, this.kode, this.nama, this.sks, {super.key});

  @override
  State<Update> createState() => _UpdateState();
}

final ApiService _apiService = ApiService();
TextEditingController _kodeController = TextEditingController();
TextEditingController _namaController = TextEditingController();
TextEditingController _sksController = TextEditingController();

class _UpdateState extends State<Update> {
  @override
  void initState() {
  super.initState();
  // Set initial values for controllers based on widget parameters
  _kodeController.text = widget.kode;
  _namaController.text = widget.nama;

  // Konversi widget.sks menjadi string dan kemudian isi ke _sksController.text
  _sksController.text = widget.sks.toString();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              ElevatedButton(
                onPressed: () async {
                  // Konversi _sksController.text menjadi integer
                  int sksValue = int.tryParse(_sksController.text) ?? 0;

                  Matakuliah editPost = Matakuliah(
                    id: widget.id,
                    kode: _kodeController.text,
                    nama: _namaController.text,
                    sks: sksValue,  // Gunakan nilai integer yang sudah dikonversi
                  );

                  print(_namaController.text);

                  // Cetak log untuk memeriksa apakah data yang diperbarui benar-benar dikirim ke server
                  // print("Updating post: ${editPost.id}");

                  Matakuliah editedPost = await _apiService.updateMatakuliah(editPost);
                },
                child: const Text('Update'),
              )

            ],
          ),
        ),
      ),
    );
  }
}
