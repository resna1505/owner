import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kampus/models/campus_news_model.dart';

class CampusNewsService {
  Future<List<CampusNewsModel>> getCampusNews() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://ams-api.univbatam.ac.id/index.php/mahasiswa/pengumuman',
        ),
      );

      if (res.statusCode == 200) {
        return List<CampusNewsModel>.from(jsonDecode(res.body)
                .map((campusnews) => CampusNewsModel.fromJson(campusnews)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
