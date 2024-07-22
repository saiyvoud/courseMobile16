import 'package:fashion_store/components/hive_database.dart';

class CartService {
  Future<List<dynamic>?> getCart() async {
    try {
      final result = await HiveDatabase.getCart();
      if (result!.length > 0) {
        return result;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> saveCart({
    required String productId,
    required String name,
    required String detail,
    required int amount,
    required int price,
    required String image,
    required String size,
  }) async {
    try {
      final result = await HiveDatabase.saveCart(
        productId: productId,
        name: name,
        detail: detail,
        amount: amount,
        price: price,
        image: image,
        size: size,
      );
      if(result == true){
       return true;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
