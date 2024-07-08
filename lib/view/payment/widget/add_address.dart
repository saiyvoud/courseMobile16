import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final village = TextEditingController();
  final district = TextEditingController();
  final province = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

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
          'add address',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "ບ້ານ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: village,
                  cursorHeight: 50,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "ຊື່ບ້ານ",
                      border: InputBorder.none),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ຊື່ບ້ານຫ້າມວ່າງ!";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "ເມືອງ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: district,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "ເມືອງ",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ເມືອງຫ້າມວ່າງ!";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "ແຂວງ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: province,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "ແຂວງ",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ແຂວງຫ້າມວ່າງ!";
                    }
                    return null;
                  },
                ),
              ),
            ),
            userLocation == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: 120,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            userLocation!.latitude!, userLocation!.longitude!),
                        zoom: 14,
                      ),
                      // markers: myMarKer(),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "ບັນທຶກ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
