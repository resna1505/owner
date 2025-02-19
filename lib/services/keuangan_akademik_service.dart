import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/keuangan_akademik_model.dart';

class KeuanganAkademikService {
  Future<KeuanganAkademikModel> getKeuanganAkademik() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/owner/pendapatan',
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
