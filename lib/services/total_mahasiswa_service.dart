import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/total_mahasiswa_model.dart';
import 'package:kampus/shared/shared_values.dart';

class TotalMahasiswaService {
  Future<TotalMahasiswaModel> getMahasiswa() async {
    try {
      final uri = Uri.parse('$baseUrl/akademik/jmldatamhs');

      final res = await http.get(uri);

      if (res.statusCode == 200) {
        // Parse sebagai objek tunggal
        return TotalMahasiswaModel.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
