import 'package:fashion_store/service/order_service.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  final orderService = OrderService();
  List<dynamic> _orderAwait = [];
  List<dynamic> _orderPadding = [];
  List<dynamic> _orderSuccess = [];
  List<dynamic> get orderAwait => _orderAwait;
  List<dynamic> get orderPadding => _orderPadding;
  List<dynamic> get orderSuccess => _orderSuccess;

  Future<void> getOrderByStatusAwait() async {
    try {
      _loading = true;
      final result = await orderService.getOrderAwait();
      if (result!.length > 0) {
        _orderAwait = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> getOrderByStatusPadding() async {
    try {
      _loading = true;
      final result = await orderService.getOrderPadding();
      if (result!.length > 0) {
        _orderPadding = result;
         _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> getOrderByStatusSuccess() async {
    try {
      _loading = true;
      final result = await orderService.getOrderSuccess();
      if (result!.length > 0) {
        _orderSuccess = result;
          _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
