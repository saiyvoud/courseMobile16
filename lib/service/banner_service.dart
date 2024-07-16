import 'package:dio/dio.dart';
import 'package:fashion_store/config/apiPath.dart';
class BannerService {
  final dio = new Dio();
   Future<List<dynamic>?> getBanner ()async{
    try {
      final response = await dio.get(ApiPath.getBanner);
      if(response.data['status'] == true){
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
   }
}