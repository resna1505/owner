import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/beasiswa_approve_model.dart';

class BeasiswaApproveService {
  Future<List<BeasiswaApproveModel>> getBeasiswaApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/owner/dataapprovebeasiswa',
        ),
      );

      if (res.statusCode == 200) {
        return List<BeasiswaApproveModel>.from(jsonDecode(res.body)
                .map((discount) => BeasiswaApproveModel.fromJson(discount)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
