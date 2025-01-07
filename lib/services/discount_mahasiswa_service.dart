import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/discount_model.dart';

class DiscountMahasiswaService {
  Future<List<DiscountModel>> getDiscountMahasiswa() async {
    try {
      // final idmhs = await AuthService().getIdMahasiswa();
      final res = await http.get(
        Uri.parse(
          'https://ams-api-dev.univbatam.ac.id/index.php/owner/datanonapprovediskon',
        ),
      );

      if (res.statusCode == 200) {
        return List<DiscountModel>.from(jsonDecode(res.body)
            .map((discount) => DiscountModel.fromJson(discount))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
