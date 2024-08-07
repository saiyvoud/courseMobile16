import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class OrderDetail extends StatefulWidget {
  final dynamic data;
  const OrderDetail({super.key, required this.data});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "ລາຍລະອຽດອໍເດີ",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            navService.goBack();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 0.9,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  )),
                  SizedBox(height: 10),
                  Divider(),

                  // ----- company

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ຊື່ ແລະ ນາມສະກຸນ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${widget.data['userId']['firstName']} ${widget.data['userId']['lastName']}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ເບີໂທຕິດຕໍ່",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${widget.data['userId']['phoneNumber']}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ທີ່ຢູ່",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${widget.data['addressId']['village']} ${widget.data['addressId']['district']} ${widget.data['addressId']['province']}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ລາຍລະອຽດຂອງສິນຄ້າ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: widget.data['products'].length,
                      itemBuilder: (context, index) {
                        final order = widget.data['products'];
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ຊື່',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('ຈຳນວນ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('ລາຄາ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    order[index]['image'],
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(order[index]['name'],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text(order[index]['amount'].toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  Text('${order[index]['price']} LAK',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      }),

                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: CustomPaint(
                  //     painter: DrawDottedhorizontalline(),
                  //   ),
                  // ),

                  ///
                  Text(
                    "ລາຍລະອຽດການຊຳລະ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ປະເພດການຊຳລະ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "BCEL",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ວັນທີ່ ແລະ ເວລາຊຳລະ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${Jiffy.parse(widget.data['createdAt'].toString()).yMEd}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ລວມທັງໝົດ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${widget.data['totalPrice']} kip",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
