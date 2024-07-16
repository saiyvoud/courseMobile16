import 'package:dio/dio.dart';
import 'package:fashion_store/config/apiPath.dart';

class CategoryService {
  final dio = new Dio();
  Future<List<dynamic>?> getCategory() async {
    try {
      final response = await dio.get(ApiPath.getCategory);
      print(response);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
   Future<dynamic> getOneCategory({
    required String id
   }) async {
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
