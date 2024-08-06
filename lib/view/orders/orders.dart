import 'package:fashion_store/provider/order_provider.dart';
import 'package:fashion_store/provider/payment_provider.dart';
import 'package:fashion_store/view/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrderProvider>(
      
        builder: (context,orders,child) {
          if(orders.loading == true){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
           itemCount: orders.orderAwait.length,
            itemBuilder: (context,index) {
              final data = orders.orderAwait;
              return Column(
                children: [
                  Container(
                    height: 10,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "data[index]['name']",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  "data[index]['detail']",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${data[index]['price']}LAK",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text("${data[index]['amount']}/ຈຳນວນ"),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () async {
                                
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          );
        }
      ),
    );
  }
}
