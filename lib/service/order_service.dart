import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:fashion_store/components/hive_database.dart';
import 'package:fashion_store/config/apiPath.dart';
import 'package:http/http.dart' as https;

class OrderService {
  final Dio dio = new Dio();
  Future<List<dynamic>?> getOrderAwait() async {
    try {
      final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${token['token']}',
      };
      final response = await https.get(
        Uri.parse(ApiPath.getOrderByStatusAwait + user['_id']),
        headers: header,
      );
      print(response);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return  data['data'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
   Future<List<dynamic>?> getOrderPadding() async {
    try {
      final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${token['token']}',
      };
      final response = await https.get(
        Uri.parse(ApiPath.getOrderByStatusPadding + user['_id']),
        headers: header,
      );
      print(response);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return  data['data'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
   Future<List<dynamic>?> getOrderSuccess() async {
    try {
      final user = await HiveDatabase.getProfile();
      final token = await HiveDatabase.getToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${token['token']}',
      };
      final response = await https.get(
        Uri.parse(ApiPath.getOrderByStatusSuccess + user['_id']),
        headers: header,
      );
      print(response);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return  data['data'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
