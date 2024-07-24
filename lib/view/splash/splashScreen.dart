import 'dart:async';

import 'package:fashion_store/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Provider.of<AuthProvider>(
        context,
        listen: false,
      )..validateToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 220),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
