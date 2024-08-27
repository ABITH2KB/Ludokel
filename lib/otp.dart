import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:ludokhell/details.dart';

class Otp extends StatefulWidget {
  final String verificationid;
  const Otp({super.key, required this.verificationid});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10), // Reduced top padding
              child: Image.asset('asset/image/3.png', width: 220, height: 190), // Increased size
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10), // Adjust the top padding to 10
              child: Stack(
                children: [
                  Positioned(
                    top: 10, // Adjust the top position to move it upwards
                    left: 130, // Adjust the left position as needed
                    child: Image.asset('asset/image/2.png', width: 180, height: 180),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44, top: 80, right: 30), // Reduced top padding
                    child: Container(
                      width: 370,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFF8A8A),
                            width: 4), // Adjust the value for more or less curvature
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'OTP VERIFICATION',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                                fontFamily: 'chyler'
                            ),
                          ),
                          const SizedBox(height: 15),
                          Image.asset('asset/image/lock.png', width: 150, height: 160),
                          const SizedBox(height: 10),
                          const Text(
                            'We will send  OTP to the registered',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'mobile number ',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const Text(
                            '',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 50,
                              width: 270,
                              child: TextField(
                                controller: otpcontroller,
                                style: const TextStyle(
                                  color: Colors.white, // Set the text color to white
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Colors.black,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red, // Set the border color to red
                                      width: 2.0, // You can adjust the width of the border if needed
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red, // Set the border color to red when the field is focused
                                      width: 2.0, // You can adjust the width of the border if needed
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: widget.verificationid,
                                        smsCode: otpcontroller.text.toString());
                                    await FirebaseAuth.instance
                                        .signInWithCredential(credential)
                                        .then((value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const details()),
                                      );
                                    });
                                  } catch (ex) {
                                    log(ex.toString());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Failed to verify OTP. Please try again.')),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove padding so the image fits correctly
                                  primary: Colors.transparent, // Make the button background transparent
                                  shadowColor: Colors.transparent, // Remove the shadow
                                ),
                                child: Image.asset(
                                  'asset/image/4.png',
                                  width: 190,
                                  height: 120,
                                ),
                              ),
                            ),
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
