import 'dart:io';

import 'package:fashion_store/components/messageHelper.dart';
import 'package:fashion_store/router/router.dart';
import 'package:fashion_store/service/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

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
  List<dynamic> _addresInLocal = [];
  List<dynamic> get addresies => _addresies;
  List<dynamic> get addressByUser => _addressByUser;
  List<dynamic> get addresInLocal => _addresInLocal;
  get address => _address;
  
 
  Future<void> payment({
    required String addressId,
    required int totalPrice,
    required File billQR,
    required List<dynamic> products,
  }) async {
    try {
      final result = await paymentService.payment(
        addressId: addressId,
        totalPrice: totalPrice,
        billQR: billQR,
        products: products
      );
      navService.goBack();
      if (result == true) {
        _loading = false;
        MessageHepler.showSnackBarMessage(isSuccess: true,message: "Success");
        navService.pushNamed(RouteAPI.home);
         
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
     // navService.goBack();
       MessageHepler.showSnackBarMessage(isSuccess: false,message: e);
      notifyListeners();
    }
  }

  Future<void> getAddressInLocal() async {
    _loading = true;
    try {
      final result = await paymentService.getAddressInLocal();
      print(result);
      if (result!.length > 0) {
        
        _loading = false;
        _addresInLocal = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> saveAddress(dynamic data) async {
    _loading = true;
    try {
      final result = await paymentService.saveAddress(data);
      if (result == true) {
        _loading = false;
        MessageHepler.showSnackBarMessage(
            isSuccess: true, message: "save address success");
            getAddressInLocal();
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
      navService.goBack();
      if (result == true) {
        MessageHepler.showSnackBarMessage(isSuccess: true, message: "Success");
        getByUser();
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      MessageHepler.showSnackBarMessage(isSuccess: false, message: "Faild");
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

  Future<void> getByUser() async {
    _loading = true;
    try {
      final result = await paymentService.getByUser();

      if (result!.length > 0) {
        _loading = false;
        _addressByUser = result;

        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
