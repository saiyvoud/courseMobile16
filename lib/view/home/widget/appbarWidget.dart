import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 final GlobalKey<ScaffoldState> _scaffoldKey =
              GlobalKey<ScaffoldState>();
AppBarWidget(context) {
  return
   AppBar(
    backgroundColor: Colors.amber,
    //leading: Icon(Icons.menu),
    leading: Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
         
          _scaffoldKey.currentState!.openDrawer();
        },
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
      Padding(
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
      Padding(
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
    ],
  );

}
