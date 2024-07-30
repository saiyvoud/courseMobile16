import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_store/components/hive_database.dart';
import 'package:http/http.dart' as http;
import 'package:fashion_store/config/apiPath.dart';

class AuthService {
  final Dio dio = Dio();
   Future<bool> refreshToken() async {
    try {
      final result = await HiveDatabase.getToken();
      final data = {
        "refreshToken": result['refreshToken'],
      };
      final response = await dio.post(
        ApiPath.refreshToken,
        data: data,
      );
      print(response.data);
      if (response.data['status'] == true) {
        await HiveDatabase.saveToken(
          token: response.data['data']['token'],
          refreshToken: response.data['data']['refreshToken'],
        );
        return true;
      }
      return false;
    } catch (e) { 
      return false;
    }
  }

   Future<bool> validateToken() async {
    try {
      final result = await HiveDatabase.getToken();
      print(result);
      if (result == null || result['token'].toString().isEmpty) {
        return false;
      }
      print(result);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<dynamic> getProfile()async{
    try {
      final result = await HiveDatabase.getProfile();
       return result;
    } catch (e) {
      
    }
  }
   Future<bool> logout() async {
    try {
      final result = await HiveDatabase.deleteAll();
      
      if (result != true) {
        return false;
      }
     
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
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

      print(response.body);
      final newData = jsonDecode(response.body);
      if (newData['status'] == true) {
        await HiveDatabase.saveProfile(data: jsonEncode(newData['data']));
        await HiveDatabase.saveToken(
          token: newData['data']['token'],
          refreshToken: newData['data']['refreshToken'],
        );
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
