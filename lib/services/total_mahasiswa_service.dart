import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/total_mahasiswa_model.dart';

class TotalMahasiswaService {
  Future<TotalMahasiswaModel> getMahasiswa() async {
    try {
      final uri = Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/akademik/jmldatamhs');

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
