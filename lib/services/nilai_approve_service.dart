import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/nilai_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class NilaiApproveService {
  Future<List<NilaiApproveModel>> getNilaiApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/dataapprovenilai',
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
