import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/beasiswa_non_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class BeasiswaNonApproveService {
  Future<List<BeasiswaNonApproveModel>> getBeasiswaNonApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/datanonapprovebeasiswa',
        ),
      );

      if (res.statusCode == 200) {
        return List<BeasiswaNonApproveModel>.from(jsonDecode(res.body)
                .map((discount) => BeasiswaNonApproveModel.fromJson(discount)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
