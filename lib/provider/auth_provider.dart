import 'package:fashion_store/components/messageHelper.dart';
import 'package:fashion_store/router/router.dart';
import 'package:fashion_store/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthProvider extends ChangeNotifier {
  // parameter in side _
  // send parameter out side it'has `get =>`
  dynamic _userData;
  final authService = AuthService();
  dynamic get userData => _userData;

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final result = await authService.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      navService.goBack();
      if (result != null) {
        print("Login Success");
        MessageHepler.showSnackBarMessage(
            isSuccess: true, message: "Login Success");
        navService.pushNamedAndRemoveUntil(RouteAPI.home);
      } else {
        MessageHepler.showSnackBarMessage(
            isSuccess: false, message: "phoneNumber and password is not match");
        print("Login Faild");
      }
    } catch (e) {
      MessageHepler.showSnackBarMessage(isSuccess: false, message: e);
      print("Login Faild $e");
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final result = await authService.register(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        password: password,
      );
      navService.goBack();
      if (result != null) {
        MessageHepler.showSnackBarMessage(
            isSuccess: true, message: "Register Success");
        navService.pushNamed(RouteAPI.login);
      }
    } catch (e) {
      MessageHepler.showSnackBarMessage(
          isSuccess: false, message: e.toString());
      print("Register Faild $e");
    }
  }
}
