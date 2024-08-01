import 'dart:async';
import 'dart:io';

import 'package:fashion_store/components/loading.dart';
import 'package:fashion_store/provider/auth_provider.dart';
import 'package:fashion_store/provider/payment_provider.dart';
import 'package:fashion_store/view/payment/widget/address.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  final List<dynamic> cart;
  const Payment({super.key,required this.cart});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    _getUserLocation();
    Provider.of<PaymentProvider>(context, listen: false)..getAddressInLocal();
    Provider.of<AuthProvider>(context, listen: false)..getProfile();
  }

  final ImagePicker _picker = ImagePicker();
  File? _files;
  XFile? _image;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? userLocation;
  Future<void> _getUserLocation() async {
    Location location = Location();
    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      // if (!_serviceEnabled) {
      //   return;
      // }
    }
    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      userLocation = locationData;
    });
  }

  // Future<File> getImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image == null) {}
  //   // setState(() {
  //   //   _image = image;
  //   // });
  //   var file = File(image!.path);
  //   return file;
  // }

  Future<File?> pickCamera() async {
    try {
      final XFile? xImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (xImage == null) {}
      var image = File(xImage!.path);
      print(image);
      return image;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File?> pickGallery() async {
    try {
      final XFile? xImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (xImage == null) {}
      var image = File(xImage!.path);
      return image;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
        builder: (context, paymentProvider, child) {
      if (paymentProvider.loading == true) {
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
              'payment',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
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
            'payment',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ຊ່ອງທາງຕິດຕໍ່',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    // Spacer(),
                    // Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Consumer<AuthProvider>(builder: (_, authProvider, __) {
                  if (authProvider.loading == true) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ຊື່ ແລະ ນາມສະກຸນ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text(
                                '${authProvider.userData['firstName']} ${authProvider.userData['lastName']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ເບີໂທຕິດຕໍ່',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('+856 ${authProvider.userData['phoneNumber']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10),

                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ສະຖານທີ່ຈັດສົ່ງສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    paymentProvider.addresInLocal[0] == null
                        ? SizedBox()
                        : IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddressView()));
                            },
                            icon: Icon(Icons.edit, color: Colors.green),
                          ),
                  ],
                ),
                SizedBox(height: 10),
                Consumer<PaymentProvider>(builder: (context, address, child) {
                  if (address.loading == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (address.addresInLocal[0] == null) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressView(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(color: Colors.green),
                        child: Center(
                          child: Text(
                            "ເພີ່ມສະຖານທີ່ຈັດສົ່ງ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ບ້ານ ເມືອງ ແຂວງ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text(
                                '${address.addresInLocal[0]['village']} ${address.addresInLocal[0]['district']} ${address.addresInLocal[0]['province']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      userLocation == null
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              height: 120,
                              decoration: BoxDecoration(color: Colors.amber),
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(userLocation!.latitude!,
                                      userLocation!.longitude!),
                                  zoom: 14,
                                ),
                                // markers: myMarKer(),
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                              ),
                            )
                    ],
                  );
                }),
                SizedBox(height: 10),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ລາຍລະອຽດສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),

                // Consumer<CartProvider>(builder: (_, cartProvider, __) {
                //   if (cartProvider.loading == true) {
                //     return CircularProgressIndicator();
                //   }
                //   return ListView.builder(
                //       shrinkWrap: true,
                //       primary: false,
                //       itemCount: cartProvider.carts.length,
                //       itemBuilder: (context, index) {

                //         return
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ຮູບສິນຄ້າ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ຊື່',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ຈຳນວນ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ລາຄາ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://img.lazcdn.com/g/p/cbee361b3903691ad5aa656897bfb991.png_200x200q80.png_.webp",
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                          Text('name',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('2',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Text('100,000 LAK',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.red)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ລາຄາລວມ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('200,000 Kip',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text('ລາຍລະອຽດການຊຳລະ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/onepay.png",
                    height: 220,
                    width: 220,
                  ),
                ),
                SizedBox(height: 20),
                _files == null
                    ? Center(
                        child: Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.cloud_upload,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Drag&Drop files here",
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  Text(
                                    "or",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showAlert(context);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Browse Files",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            showAlert(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _files!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                //   );
                // });
                // })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Loading(context);
              paymentProvider.payment(
                addressId: paymentProvider.addresInLocal[0]['_id'],
                totalPrice: 1000000,
                billQR: _files!,
                products: widget.cart,
                
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  'ຊຳລະເງີນ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void showAlert(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ອັບໂຫລດຮູບພາບ'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    try {
                      _files = await pickCamera();
                      // final cropImage =
                      //     await cubit.cropImage(imageFile: files!);
                      // File fileName = File(cropImage!.path);
                      setState(() {
                        _files;
                      });
                    } catch (e) {}
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text('ຖ່າຍຮູບພາບ'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      _files = await pickGallery();
                      // final cropImage =
                      //     await cubit.cropImage(imageFile: files!);
                      // File fileName = File(cropImage!.path);
                      setState(() {
                        _files;
                      });
                    } catch (e) {}
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_library,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text('ເລືອກຮູບພາບ'),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          );
        });
  }
}
