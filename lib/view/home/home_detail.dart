// ignore_for_file: deprecated_member_use

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:fashion_store/components/loading.dart';
import 'package:fashion_store/provider/cart_provider.dart';
import 'package:fashion_store/view/home/widget/home_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeDetail extends StatefulWidget {
  final dynamic data;
  final String image;

  const HomeDetail({
    super.key,
    required this.image,
    required this.data,
  });

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  List<String> size = [
    "Size: S",
    "Size: M",
    "Size: L",
    "Size: XL",
    "Size: X2L",
  ];
  int currenIndex = 0;
  int _amount = 1;
  onTap(index) {
    setState(() {
      currenIndex = index;
    });
  }

  onChanageAdd() {
    setState(() {
      _amount++;
    });
  }

  onChanageRemove() {
    setState(() {
      _amount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              HomeDetailItem(
                image: widget.image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 350,
                ),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.data['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                      width: 220,
                                      child: Text(
                                        widget.data['detail'],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "${widget.data['price']} Lak",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            AnimatedRatingStars(
                              initialRating: 3.5,
                              minRating: 0.0,
                              maxRating: 5.0,
                              filledColor: Colors.amber,
                              emptyColor: Colors.grey,
                              filledIcon: Icons.star,
                              halfFilledIcon: Icons.star_half,
                              emptyIcon: Icons.star_border,
                              onChanged: (double rating) {
                                // Handle the rating change here
                                print('Rating: $rating');
                              },
                              displayRatingValue: true,
                              interactiveTooltips: true,
                              customFilledIcon: Icons.star,
                              customHalfFilledIcon: Icons.star_half,
                              customEmptyIcon: Icons.star_border,
                              starSize: 18.0,
                              animationDuration: Duration(milliseconds: 300),
                              animationCurve: Curves.easeInOut,
                              readOnly: false,
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 5),
                            //   child: Text("/ " +
                            //       newData[widget.index]['amount'].toString() +
                            //       " ຈຳນວນ"),
                            // )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: size.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        onTap(index);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: currenIndex == index
                                                ? Colors.red
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: currenIndex == index
                                                ? Border.all(
                                                    color: Colors.transparent)
                                                : Border.all(
                                                    color: Colors.grey,
                                                  )),
                                        child: Center(
                                          child: Text(
                                            size[index],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: currenIndex == index
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: currenIndex == index
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                           
                            Icon(
                              Icons.car_repair_sharp,
                              color: Colors.green,
                              size: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "ລາຍລະອຽດການຈັດສົ່ງ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "labubu lลาบูบู้ น่ารัก อุปกรณ์ตุ๊กตา ตุ๊กตา ของขวัญวันเกิด ของเล่นผู้ หญิง หรับบ้านตุ๊กตา CUTE DIY 1 Set อุปกรณ์เสริมของเล่น เสื้อเบลาส์ ชุดเดรส เสื้อผ้าตุ๊กตาผ้า เสื้อผ้าตุ๊กตาผ้า ชุดของเล่นสำหรับเด็ก",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                onChanageAdd();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(_amount.toString()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                if (_amount > 1) {
                                  onChanageRemove();
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<CartProvider>(
          builder: (context,cartProvider,child) {
            return Container(
              height: 100,
              //decoration: BoxDecoration(color: Colors.cyan),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Loading(context);
                        cartProvider.saveCart(
                            productId: widget.data['_id'],
                            name: widget.data['name'],
                            detail: widget.data['detail'],
                            amount: _amount,
                            price: widget.data['price'],
                            image: widget.data['image'],
                            size: size[currenIndex],
                            );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => CartDetail(),
                        //   ),
            
                        // final result = await HiveDatabase.getCart();
            
                        // if (result!
                        //     .contains(value.products[widget.index]['_id'])) {
                        //   cart.addQtyCart(qty: _amount);
                        //   print("======>update");
                        // } else {
                        // cart.addNewCart(
                        //   productId: value.products[widget.index]['_id'],
                        //   name: value.products[widget.index]['name'],
                        //   detail: value.products[widget.index]['detail'],
                        //   qty: _amount,
                        //   price: value.products[widget.index]['price'],
                        //   image: value.products[widget.index]['image'],
                        // );
                        print("======>add");
                        // }
                      },
                      child: Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_shopping_cart,color: Colors.white,size: 30,)
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "ຊື້ສິນຄ້າເລີຍ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ));
  }
}
