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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      // appBar: AppBarWidget(context),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: _openDrawer,
            child: SvgPicture.asset(
              "assets/icons/bars-sort.svg",
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Consumer<AuthProvider>(
            builder: (context,auth,child) {
              return GestureDetector(
                onTap: (){
                
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
          ),
          Consumer<AuthProvider>(
            builder: (context,auth,child) {
              return GestureDetector(
                onTap: (){
                   auth.logout();
                   Loading(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ), //circleAvatar
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),

                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
