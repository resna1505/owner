import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kampus/services/auth_service.dart';
import 'package:kampus/shared/shared_values.dart';

class UserService {
  Future<String> updatePassword(String oldPassword, String newPassword) async {
    try {
      final idmhs = await AuthService().getIdMahasiswa();

      final res = await http.post(
        Uri.parse('$baseUrl/owner/ubah_password'),
        body: jsonEncode({
          'id': idmhs,
          'passlama': oldPassword,
          'pass': newPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        print(json);
        return json['message'] ?? 'Password berhasil diubah';
      } else {
        final json = jsonDecode(res.body);
        throw json['messages']?['error'] ?? 'Terjadi kesalahan';
      }
    } catch (e) {
      rethrow;
    }
  }
}
