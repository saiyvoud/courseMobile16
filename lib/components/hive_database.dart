import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static BoxCollection? box;
  Future<BoxCollection?> hiveDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    box = await BoxCollection.open(
      'mobileDB', // Name of your database
      {'auth', 'cart'}, // Names of your boxes
      path: directory.path,
    );
    return box;
  }

  // ------- get -------
  static Future<dynamic> getProfile() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['profile']);
    final respone = jsonDecode(data[0]!['data']);
    print(respone);
    return respone;
  }

  static Future<dynamic> getToken() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['token']);
    return data[0];
  }

    static Future<List<dynamic>?> getCart() async {
    try {
      final myBox = await Hive.openBox<Map>('cart');
      final data = await myBox.values.toList();
      return data;
    } catch (e) {
      return null;
    }
  }

  // ------ save ----------
 static Future<bool?> saveProfile({
    required String data,
  }) async {
    try {
      final userBox = await box!.openBox('auth');
      await userBox.put("user", {
        "data": data,
      });
      return true;
    } catch (e) {
      print(e);
      return null;
    }
  }

 static Future<bool?> saveToken({
    required String token,
    required String refreshToken,
  }) async {
    try {
      final userBox = await box!.openBox('auth');
      await userBox.put("token", {
        "token": token,
        "refreshToken": refreshToken,
      });
      return true;
    } catch (e) {
      print(e);
      return null;
    }
  }

 static Future<bool?> saveCart({
    required String productId,
    required String name,
    required String detail,
    required int amount,
    required int price,
    required String size,
    required String image,
  }) async {
    try {
      final cartBox = await Hive.openBox<Map>("cart");
      await cartBox.add({
        "productId": productId,
        "name": name,
        "detail": detail,
        "amount": amount,
        "price": price,
        "image": image,
        "size": size
      });
      return true;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
