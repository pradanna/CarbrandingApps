import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> login(String email, String password) async {
    try {
      Response response = await Dio().post(
        'http://192.168.0.101:80/driver/auth/sign-in' , data: {
          'email' : email,
          'password' : password,
      }, options: Options(
        headers: {
          'Accept': 'application/json'
        }
      )

      // Pastikan URL ini benar
      );
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
