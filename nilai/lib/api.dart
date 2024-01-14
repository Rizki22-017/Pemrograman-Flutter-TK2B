import 'dart:convert';

import 'package:nilai/nilai.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.43.221:9003/api/v1/nilai';

  Future<List<Nilai>> getNilai() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Nilai.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load mahasiswa');
    }
  }

  Future<Nilai> createNilai(Nilai nilai) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nilai.toJson()),
    );

    if (response.statusCode == 200) {
      //return Mahasiswa.fromJson(json.decode(response.body));
      return Nilai(
        id: 0,
        idmahasiswa: nilai.idmahasiswa,
        idmatakuliah: nilai.idmatakuliah,
        nilai: nilai.nilai,
      );
    } else {
      throw Exception('Failed to create mahasiswa');
    }
  }

  Future<Nilai> updateNilai(Nilai nilai) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${nilai.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nilai.toJson()),
    );

    if (response.statusCode == 200) {
      return Nilai.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update mahasiswa');
    }
  }

  Future<void> deleteNilai(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete mahasiswa');
    }
  }
}
