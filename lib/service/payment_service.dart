import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fashion_store/config/apiPath.dart';

class PaymentService {
  final dio = new Dio();
  Future<bool?> payment({
    required String orderId,
    required int totalPrice,
    required File billQR,
  }) async {
    try {
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
            "Bearer": "TOKEN"
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
      final data = {
        "village": village,
        "district": district,
        "province": province,
        "detail": detail,
        "latitude": latitude,
        "longitude": longitude
      };
      final response = await dio.post(
        ApiPath.getBanner,
        data: data,
        // options: Options(),
      );
      print(response);
      if (response.data['status'] == true) {
        print(response.data['data']);
        return true;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<dynamic>?> getAllAddress() async {
    try {
      final response = await dio.get(ApiPath.getOneCategory);
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
      final response = await dio.get(ApiPath.getOneCategory + id);
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
