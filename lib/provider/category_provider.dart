import 'package:fashion_store/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final categoryService = CategoryService();
  bool _loading = false;
  List<dynamic> _category = [];
  dynamic _categoryOne;
  get loading => _loading;
  List<dynamic> get category => _category;
  dynamic get categoryOne => _categoryOne;
  
  Future<void> getCategory() async {
    _loading = true;
    try {
      final result = await categoryService.getCategory();
      if (result != null) {
        _category = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getOneCategory({required String id}) async {
    _loading = true;
    try {
      final result = await categoryService.getOneCategory(id: id);
      if (result != null) {
        _categoryOne = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
