import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/krs_approve_model.dart';

class KrsApproveService {
  Future<List<KrsApproveModel>> getKrsApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/owner/dataapprovekrs',
        ),
      );

      if (res.statusCode == 200) {
        return List<KrsApproveModel>.from(jsonDecode(res.body)
            .map((discount) => KrsApproveModel.fromJson(discount))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
