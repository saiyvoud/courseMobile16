import 'package:fashion_store/service/banner_service.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  final bannerService = BannerService();
  bool _loading = false;
  List<dynamic> _banner = [];
  get loading => _loading;
  List<dynamic> get banner => _banner;

  Future<void> getBanner() async {
    _loading = true;
    try {
      final result = await bannerService.getBanner();
      if (result != null) {
        _loading = false;
        _banner = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
