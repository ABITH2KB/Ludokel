import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ludokhell/home.dart';
import 'bottom2.dart';
class details extends StatefulWidget {
  const details({super.key});
  @override
  State<details> createState() => _LoginState();
}
class _LoginState extends State<details> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();
  Future<void> storeData() async {
    try {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String referralCode = referralCodeController.text.trim();



      await FirebaseFirestore.instance
          .collection('details')
          .doc('sBV7jEWoXP8KrM5yzh72')
          .set({
        'name': name,
        'emailid': email,
        'referralCode': referralCode,
      }, SetOptions(merge: true));

    } catch (e) {
      print('Error storing data: ${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Image(
                  image: AssetImage('asset/image/3.png'),
                  width: 220,
                  height: 190),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  const Positioned(
                    top: 10,
                    left: 240,
                    child: Image(
                        image: AssetImage('asset/image/2.png'),
                        width: 180,
                        height: 180),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44, top: 80, right: 30),
                    child: Container(
                      width: 370,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: const Color(0xFFFF8A8A), width: 4),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'R E F E R A L',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                                color: Colors.red,
                                fontFamily: 'chyler'
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(right: 140),
                            child: Text(
                              'Enter the name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                             ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 50,
                              width: 270,
                              child: TextField(
                                controller: nameController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Colors.black,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(right: 140),
                            child: Text(
                              '  Enter Email Address',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 50,
                              width: 270,
                              child: TextField(
                                controller: emailController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Colors.black,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(right: 140),
                            child: Text(
                              '  Enter Referral Code',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 50,
                              width: 270,
                              child: TextField(
                                controller: referralCodeController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Colors.black,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await storeData();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  btab()),
                              );
                            },
                            child: const Image(
                                image: AssetImage('asset/image/5.png'),
                                width: 190,
                                height: 120),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
