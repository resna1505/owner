import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/krs_non_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class KrsNonApproveService {
  Future<List<KrsNonApproveModel>> getKrsNonApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/datanonapprovekrs',
        ),
      );

      if (res.statusCode == 200) {
        return List<KrsNonApproveModel>.from(jsonDecode(res.body)
            .map((discount) => KrsNonApproveModel.fromJson(discount))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
