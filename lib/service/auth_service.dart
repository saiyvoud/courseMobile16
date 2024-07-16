import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:fashion_store/config/apiPath.dart';

class AuthService {
  final Dio dio = Dio();
  Future<dynamic>? login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final header = {
        "Accepts": "Application/json",
      };
      final data = {
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(ApiPath.login),
        body: data,
        headers: header,
      );
      // final response = await dio.post(
      //   ApiPath.login,
      //   data: data,
      //   options: Options(
      //     headers: {'Content-Type': 'application/json'},
      //   ),
      // );
      print(response.body);
       final newData = jsonDecode(response.body);
      if (newData['status'] == true) {
        return newData['data'];
      } else {
        return null;
      }
    } catch (e) {
      print("Faiild ====> $e");
      rethrow;
    }
  }

  Future<dynamic>? register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      };
      final response = await dio.post(ApiPath.register, data: data);
      if (response.data['status'] == true) {
        return response.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
