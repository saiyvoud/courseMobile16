import 'package:fashion_store/service/banner_service.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  final bannerService = BannerService();
  bool _loading = false;
  get loading => _loading;
  Future<void> getBanner ()async{
    _loading = false;
    try {
      final result = await bannerService.getBanner();
      if(result !=null){
        _loading = true;
        notifyListeners();
      }
    } catch (e) {
      _loading = true;
      notifyListeners();
    }
  }
}