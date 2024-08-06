import 'package:fashion_store/components/loading.dart';
import 'package:fashion_store/provider/auth_provider.dart';
import 'package:fashion_store/view/home/home.dart';
import 'package:fashion_store/view/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  Widget currenWidget = HomeView();
  onTap(Widget widget){
    setState(() {
      currenWidget = widget;
    });
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
              title: const Text(' Home'),
              onTap: () {
                onTap(HomeView());
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text(' My Order '),
              onTap: () {
                onTap(OrderView());
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
     body: currenWidget
    );
  }
}