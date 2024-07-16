import 'package:fashion_store/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final productService = ProductService();
  bool _loading = false;
  List<dynamic> _product = [];
  List<dynamic> _productBy = [];
  get loading => _loading;
  List<dynamic> get product => _product;
  List<dynamic> get productBy => _productBy;

  Future<void> getProduct() async {
    _loading = true;
    try {
      final result = await productService.getProduct();
      if (result != null) {
        _product = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getProductByCategory({required String id}) async {
    _loading = true;
    try {
      final result = await productService.getProductByCategory(id: id);
      if (result != null) {
        _productBy = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
