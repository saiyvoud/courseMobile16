import 'package:fashion_store/components/messageHelper.dart';
import 'package:fashion_store/service/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class CartProvider extends ChangeNotifier {
  final cartService = CartService();
  bool _loading = false;
  List<dynamic> _carts = [];
  get loading => _loading;
  List<dynamic> get carts => _carts;
  Future<void> getCart() async {
    _loading = true;
    try {
      final result = await cartService.getCart();
      if (result!.length > 0) {
        _loading = false;
        _carts = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> saveCart({
    required String productId,
    required String name,
    required String detail,
    required int amount,
    required int price,
    required String image,
    required String size,
  }) async {
    _loading = true;
    try {
      final result = await cartService.saveCart(
        productId: productId,
        name: name,
        detail: detail,
        amount: amount,
        price: price,
        image: image,
        size: size,
      );
      navService.goBack();
      if (result == true) {
        MessageHepler.showSnackBarMessage(
            isSuccess: true, message: "Cart Success");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHepler.showSnackBarMessage(
          isSuccess: false, message: "Faild Cart");
      _loading = false;
      notifyListeners();
    }
  }
}
