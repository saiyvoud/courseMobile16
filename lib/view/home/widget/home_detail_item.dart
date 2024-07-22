import 'package:fashion_store/provider/cart_provider.dart';
import 'package:fashion_store/view/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        Consumer<CartProvider>(
          builder: (context,cartProvider,child) {
            return Positioned(
              top: 35,
              right: 10,
              child: GestureDetector(
                onTap: () async{
                
                 await cartProvider.getCart();
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.red.shade300,
                    size: 25,
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
