import 'package:fashion_store/provider/product_provider.dart';
import 'package:fashion_store/view/home/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProduct extends StatefulWidget {
  const MultiProduct({super.key});

  @override
  State<MultiProduct> createState() => _MultiProductState();
}

class _MultiProductState extends State<MultiProduct> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child) {
      if (product.loading == true) {
        return Center(child: CircularProgressIndicator());
      }
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: product.productBy.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.55,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetail(
                    image: product.product[index]['image'],
                    data: product.product[index],
                  ),
                ),
              );
            },
            child: Container(
              height: 180,
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      // "https://img.lazcdn.com/g/p/cbee361b3903691ad5aa656897bfb991.png_200x200q80.png_.webp",
                      product.product[index]['image'],
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        product.productBy[index]['name'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        product.productBy[index]['detail'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.productBy[index]['price'].toString() +
                                " LAK",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
