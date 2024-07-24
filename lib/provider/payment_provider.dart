import 'dart:io';

import 'package:fashion_store/service/payment_service.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  final village = TextEditingController();
  final district = TextEditingController();
  final province = TextEditingController();
  final detail = TextEditingController();

  final paymentService = PaymentService();
  bool _loading = false;
  bool get loading => _loading;
  dynamic _address;
  List<dynamic> _addressByUser = [];
  List<dynamic> _addresies = [];
  List<dynamic> get addresies => _addresies;
  List<dynamic> get addressByUser => _addressByUser; 
  get address => _address;

  Future<void> payment({
    required String orderId,
    required int totalPrice,
    required File billQR,
  }) async {
    try {
      final result = await paymentService.payment(
        orderId: orderId,
        totalPrice: totalPrice,
        billQR: billQR,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addAddress({
    required String village,
    required String district,
    required String province,
    required String detail,
    required double latitude,
    required double longitude,
  }) async {
    _loading = true;
    try {
      final result = await paymentService.addAddress(
        village: village,
        district: district,
        province: province,
        detail: detail,
        latitude: latitude,
        longitude: longitude,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getAllAddress() async {
    _loading = true;
    try {
      final result = await paymentService.getAllAddress();
      if (result == true) {
        _addresies = result!;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getOneddress({required String id}) async {
    _loading = true;
    try {
      final result = await paymentService.getOneAddress(id: id);
      if (result == true) {
        _address = result!;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> getByUser ()async{
    _loading = true;
    try {
      final result = await paymentService.getByUser();
      if(result == true){
        _addressByUser = result!;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
