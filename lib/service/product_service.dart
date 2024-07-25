import 'package:dio/dio.dart';
import 'package:fashion_store/config/apiPath.dart';

class ProductService {
  final dio = new Dio();
  Future<List<dynamic>?> getProduct() async {
    try {
      final response = await dio.get(ApiPath.getProduct);
     
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
   Future<List<dynamic>?> getProductByCategory({
    required String id
   }) async {
    try {
      final response = await dio.get(ApiPath.getProductBy + id);
     
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
