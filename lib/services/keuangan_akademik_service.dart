import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/keuangan_akademik_model.dart';
import 'package:kampus/shared/shared_values.dart';

class KeuanganAkademikService {
  Future<KeuanganAkademikModel> getKeuanganAkademik() async {
    try {
      final currentYear = DateTime.now().year.toString();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/pendapatan?tahun=$currentYear',
        ),
      );

      if (res.statusCode == 200) {
        // Parse sebagai objek tunggal
        return KeuanganAkademikModel.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
