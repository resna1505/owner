import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/beasiswa_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class BeasiswaApproveService {
  Future<List<BeasiswaApproveModel>> getBeasiswaApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/dataapprovebeasiswa',
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
