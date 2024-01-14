import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultPage extends StatelessWidget {
  final String nim;
  final String nama;
  final String nilaiMTK;
  final String nilaiAlgo;
  final String nilaiJava;

  ResultPage({
    required this.nim,
    required this.nama,
    required this.nilaiMTK,
    required this.nilaiAlgo,
    required this.nilaiJava,
  });

  @override
  Widget build(BuildContext context) {
    double mtkValue = double.tryParse(nilaiMTK) ?? 0.0;
    double algoValue = double.tryParse(nilaiAlgo) ?? 0.0;
    double javaValue = double.tryParse(nilaiJava) ?? 0.0;

    double average = (mtkValue + algoValue + javaValue) / 3;
    double max =
        [mtkValue, algoValue, javaValue].reduce((a, b) => a > b ? a : b);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildResultRow("NIM:", nim),
            buildResultRow("Nama:", nama),
            buildResultRow("Nilai MTK:", nilaiMTK),
            buildResultRow("Nilai Algo:", nilaiAlgo),
            buildResultRow("Nilai Java:", nilaiJava),
            buildResultRow("Nilai Rata-Rata:", average.toStringAsFixed(2)),
            buildResultRow("Nilai Max:", max.toStringAsFixed(2)),
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

