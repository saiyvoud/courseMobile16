import 'package:flutter/material.dart';

class HomeDetailItem extends StatelessWidget {
  final String image;
  const HomeDetailItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image.toString(),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          top: 35,
          left: 10,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          top: 35,
          right: 10,
          child: GestureDetector(
            onTap: () {
              // value.clearSum();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.red.shade300,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
