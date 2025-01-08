import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/nilai_approve_model.dart';

class NilaiApproveService {
  Future<List<NilaiApproveModel>> getNilaiApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/owner/dataapprovenilai',
        ),
      );

      if (res.statusCode == 200) {
        return List<NilaiApproveModel>.from(jsonDecode(res.body)
            .map((nilai) => NilaiApproveModel.fromJson(nilai))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
