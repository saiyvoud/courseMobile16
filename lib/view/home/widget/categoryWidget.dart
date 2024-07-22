import 'package:fashion_store/provider/category_provider.dart';
import 'package:fashion_store/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  // List<String> categories = [
  //   "ແນະນຳ",
  //   "ເສື້ອຜ້າ",
  //   "ເກີບ",
  //   "ກະເປົ່າ",
  //   "ໂມງ",
  //   "ຂອງແບນແນມ",
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, child) {
      if (category.loading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: (){
                 category.onTap(-1);
                },
                child: Container(
                  
                  decoration: BoxDecoration(
                      color: category.currentIndex == -1? Colors.red : Colors.amber, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'ທັງໝົດ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: category.category.map((e) {
                final index = category.category.indexOf(e);
            
                return Consumer<ProductProvider>(
                    builder: (context, product, child) {
                  return GestureDetector(
                    onTap: () {
                      category.onTap(index);
                      product.getProductByCategory(
                          id: category.category[index]['_id']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: category.currentIndex == index
                                ? Colors.red 
                                :  Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            e['title'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}
