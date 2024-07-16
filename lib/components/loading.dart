 import 'package:flutter/material.dart';


  Loading(context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Container(
              height: 50,
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 10),
                  Text("ກຳລັງໂຫຼດ...")
                ],
              ),
            ),
          );
        });
  }

  Success(context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            // title: Text("ສຳເລັດ"),
            content: Container(
              height: 80,
              child: Column(
                children: [
                  Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.green,
                  ),
                  Text(
                    "ສຳເລັດແລ້ວ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
