import 'package:fashion_store/components/loading.dart';
import 'package:fashion_store/provider/auth_provider.dart';
import 'package:fashion_store/provider/category_provider.dart';
import 'package:fashion_store/view/home/widget/appbarWidget.dart';
import 'package:fashion_store/view/home/widget/banner.dart';
import 'package:fashion_store/view/home/widget/categoryWidget.dart';
import 'package:fashion_store/view/home/widget/multiProduct.dart';
import 'package:fashion_store/view/home/widget/productWidget.dart';
import 'package:fashion_store/view/home/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Search(),
            ),
            BannerWidget(),
            CategoryWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.category),
                  SizedBox(width: 10),
                  Text(
                    "ທັງໝົດ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Consumer<CategoryProvider>(builder: (context, value, child) {
              if (value.currentIndex == -1) {
                return ProductWidget();
              }
              return MultiProduct();
            }),
          ],
        ),
      ),
    );
  }
}
