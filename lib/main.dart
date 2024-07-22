import 'package:fashion_store/components/hive_database.dart';
import 'package:fashion_store/components/messageHelper.dart';
import 'package:fashion_store/provider/auth_provider.dart';
import 'package:fashion_store/provider/banner_provider.dart';
import 'package:fashion_store/provider/category_provider.dart';
import 'package:fashion_store/provider/product_provider.dart';
import 'package:fashion_store/router/router.dart';
import 'package:fashion_store/view/auth/login.dart';
import 'package:fashion_store/view/home/home.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';

import 'provider/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveDatabase().hiveDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BannerProvider()..getBanner(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider()..getCategory(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductProvider()..getProduct(),
      ),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: MessageHepler.key,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteAPI.generateRoutes,
      home: HomeView(),
    );
  }
}
