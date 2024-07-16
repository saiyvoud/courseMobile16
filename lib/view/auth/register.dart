import 'package:fashion_store/components/loading.dart';
import 'package:fashion_store/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firsname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  final gobalKey = GlobalKey<FormState>();
  bool _eye = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        return Stack(
          children: [
            Image.asset(
              "assets/images/image-asset.jpg",
              fit: BoxFit.cover,
              height: 1000,
            ),
            Form(
              key: gobalKey,
              child: SingleChildScrollView(
                child: Container(
                  height: 850,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Register Page",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "ຊື່ທ່ານ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            //autovalidateMode: AutovalidateMode.always,
                            controller: firsname,
                            cursorHeight: 50,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "ຊື່ທ່ານ",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ຊື່ທ່ານຫ້າມວ່າງ!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "ນາມສະກຸນ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: lastname,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "ນາມສະກຸນ",
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ນາມສະກຸນຫ້າມວ່າງ!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "ເບີໂທລະສັບ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumber,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "209xxxxx",
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ເບີໂທຫ້າມວ່າງ!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "ລະຫັດຜ່ານ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: password,
                            obscureText: _eye,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "*****",
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _eye = !_eye;
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye_rounded),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ລະຫັດຜ່ານຫ້າມວ່າງ!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: GestureDetector(
                          onTap: () {
                            if (gobalKey.currentState!.validate()) {
                              Loading(context);
                              auth.register(
                                phoneNumber: phoneNumber.text,
                                password: password.text,
                                firstName: firsname.text,
                                lastName: lastname.text,
                              );
                             
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "ລົງທະບຽນ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 80,
                        indent: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ທ່ານເຄີຍລົງທະບຽນແລ້ວແມ່ນບໍ່!",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ເຂົ້າສູ່ລະບົບ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
