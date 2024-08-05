import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fashion_store/components/hive_database.dart';
import 'package:fashion_store/config/apiPath.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  final dio = new Dio();

  Future<bool?> payment({
    required String addressId,
    required int totalPrice,
    required File billQR,
    required List<dynamic> products,
  }) async {
    try {
      final token = await HiveDatabase.getToken();

      Map<String, String> header = {
        'Content-type': 'multipart/form-data',
        'Authorization': 'Bearer ${token['token']}',
      };
      final url = Uri.parse(ApiPath.addOrder);
      final request = http.MultipartRequest('POST', url);
      request.headers.addAll(header);

      request.fields['addressId'] = addressId.toString();
      request.fields['totalPrice'] = totalPrice.toString();
      request.fields['products'] = jsonEncode(products);
      final file = await http.MultipartFile.fromPath('billQR', billQR.path);
      request.files.add(file);

      // for (int i = 0; i < products.length; i++) {
      //   request.fields.addAll({
      //     "products[${i}][productId]": products[i]['productId'].toString(),
      //     "products[${i}][name]": products[i]['name'].toString(),
      //     "products[${i}][detail]": products[i]['detail'].toString(),
      //     "products[${i}][amount]": products[i]['amount'].toString(),
      //     "products[${i}][price]": products[i]['price'].toString(),
      //     "products[${i}][size]": products[i]['size'].toString(),
      //     "products[${i}][image]": products[i]['image'].toString(),
      //   });
      // }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
       
      if (response.statusCode == 201 || response.statusCode == 200) {
        // final Map<String, dynamic> responseData = json.decode(response.body);
        var data = json.decode(response.body);
        print("data=====>${data}");

         return true;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> getAddressInLocal() async {
    try {
      final result = await HiveDatabase.getAddressInLocal();
      if (result!.length > 0) {
        print("result====>$result");
        return result;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> saveAddress(dynamic data) async {
    try {
      final result = await HiveDatabase.saveAddress(data);
      if (result != true) {
        return false;
      }
      return result;
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
        ApiPath.addAddress,
        data: data,
        options: Options(headers: {
          // "Accept": "application/json",
          // "Content-Type": "application/json",
          'Authorization': "Bearer ${token['token']}"
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
          headers: {'Authorization': "Bearer ${token['token']}"},
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
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${token['token']}"
      };

      final response = await http.get(
        Uri.parse(ApiPath.getAddressByUser),
        headers: headers,
      );

      final newData = jsonDecode(response.body);
      if (newData['status'] == true) {
        print(newData['data']);
        return newData['data'];
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
            "Bearer ": token['token'],
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
