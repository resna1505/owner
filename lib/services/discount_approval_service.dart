import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/discount_approve_model.dart';
import 'package:kampus/shared/shared_values.dart';

class DiscountApproveService {
  Future<List<DiscountApproveModel>> getDiscountApprove() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/owner/dataapprovediskon',
        ),
      );

      if (res.statusCode == 200) {
        return List<DiscountApproveModel>.from(jsonDecode(res.body)
                .map((discount) => DiscountApproveModel.fromJson(discount)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
