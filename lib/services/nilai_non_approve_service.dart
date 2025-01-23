import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/nilai_non_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class NilaiNonApproveService {
  Future<List<NilaiNonApproveModel>> getNilaiNonApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/datanonapprovenilai',
        ),
      );

      if (res.statusCode == 200) {
        return List<NilaiNonApproveModel>.from(jsonDecode(res.body)
            .map((nilai) => NilaiNonApproveModel.fromJson(nilai))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
