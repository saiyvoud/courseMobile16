import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fashion_store/components/hive_database.dart';
import 'package:fashion_store/config/apiPath.dart';

class PaymentService {
  final dio = new Dio();
  Future<bool?> payment({
    required String orderId,
    required int totalPrice,
    required File billQR,
  }) async {
    try {
      final token = await HiveDatabase.getToken();
      var formData = FormData.fromMap({
        'order_id': orderId,
        'totalPrice': totalPrice,
        'billQR': await MultipartFile.fromFile(billQR.path)
      });
      final response = await dio.post(ApiPath.payment,
          data: formData,
          options: Options(headers: {
            "Accept": "Application/json",
            "Content-Type": "multipart/json",
            "Bearer": token['token']
          }));
      print(response);
      if (response.data['status'] == true) {
        print(response.data['data']);
        return true;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> addAddress({
    required String village,
    required String district,
    required String province,
    required String detail,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final token = await HiveDatabase.getToken();
      final data = {
        "village": village,
        "district": district,
        "province": province,
        "detail": detail,
        "latitude": latitude.toString(),
        "longitude": longitude.toString()
      };
      final response = await dio.post(
        ApiPath.getBanner,
        data: data,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Bearer": token['token']
        }),
      );
      print(response);
      if (response.data['status'] == true) {
        print(response.data['data']);
        return true;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<dynamic>?> getAllAddress() async {
    try {
      final token = await HiveDatabase.getToken();
      final response = await dio.get(
        ApiPath.getAllAddress,
        options: Options(
          headers: {
            "Bearer": token['token'],
          },
        ),
      );
      print(response);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
   Future<List<dynamic>?> getByUser() async {
    try {
      final token = await HiveDatabase.getToken();
      final response = await dio.get(
        ApiPath.getAddressByUser,
        options: Options(
          headers: {
            "Bearer": token['token'],
          },
        ),
      );
      print(response);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getOneAddress({required String id}) async {
    try {
      final token = await HiveDatabase.getToken();
      final response = await dio.get(
        ApiPath.getOneAddress + id,
        options: Options(
          headers: {
            "Bearer": token['token'],
          },
        ),
      );
      print(response);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
