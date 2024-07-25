import 'package:fashion_store/provider/payment_provider.dart';
import 'package:fashion_store/view/payment/widget/add_address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PaymentProvider>(context, listen: false)..getByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Address',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(60)),
        child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddAddress()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
      body: Consumer<PaymentProvider>(builder: (context, address, child) {
        // if (address.loading == true) {
        //   return Center(child: CircularProgressIndicator());
        // }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border.all(color: Colors.green),
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       children: [
                //         Icon(Icons.pin_drop_outlined),
                //         SizedBox(width: 10),
                //         Text("ບ້ານຫ້ວຍຫົງ ເມືອງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ"),
                //       ],
                //     ),
                //   ),
                // ),

                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: address.addressByUser.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.pin_drop_outlined),
                                SizedBox(width: 10),
                                Text(
                                    "ບ້ານຫ້ວຍຫົງ ເມືອງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ"),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
