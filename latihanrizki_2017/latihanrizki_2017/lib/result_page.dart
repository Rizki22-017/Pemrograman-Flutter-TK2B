import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String kode;
  final String nama;
  final String tarifPelanggan;
  final String jarakTempuh;
  final String jenisPelanggan;

  ResultPage({
    required this.kode,
    required this.nama,
    required this.tarifPelanggan,
    required this.jarakTempuh,
    required this.jenisPelanggan,
  });

  @override
  Widget build(BuildContext context) {
    double tarifValue = double.tryParse(tarifPelanggan) ?? 0.0;
    double jarakValue = double.tryParse(jarakTempuh) ?? 0.0;
    double jenisValue = double.tryParse(jenisPelanggan) ?? 0.0;

    double totalPembayaran = (tarifValue * jarakValue);
    double disc = ((totalPembayaran * 5) * 0.02 );

    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildResultRow("Kode Pelanggan:", kode),
            buildResultRow("Nama Pelanggan:", nama),
            buildResultRow("Tarif Perkilometer", tarifPelanggan),
            buildResultRow("Jarak Tempuh :", jarakTempuh),
            buildResultRow("Jenis Pelanggan:", jenisPelanggan),
            buildResultRow("Total Pembayaran:", totalPembayaran.toString()),
            buildResultRow("Nilai Diskon:", disc.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Widget buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
