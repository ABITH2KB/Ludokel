
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:ludokhell/otp.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  TextEditingController phonecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10), // Reduced top padding
              child: Image(image: AssetImage('asset/image/3.png'), width: 220, height: 190), // Increased size
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10), // Adjust the top padding to 10
              child: Stack(
                children: [
                  const Positioned(
                    top: 10, // Adjust the top position to move it upwards
                    left: 20, // Adjust the left position as needed
                    child: Image(image: AssetImage('asset/image/2.png'), width: 180, height: 180),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44, top: 80, right: 30), // Reduced top padding
                    child: Container(
                      width: 370,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFF8A8A), width: 4), // Adjust the value for more or less curvature
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'LOGIN NOW',
                            style: TextStyle(color: Colors.black,
                                fontFamily: 'chyler'),
                          ),
                          const SizedBox(height: 15),
                          const Image(image: AssetImage('asset/image/1.png'), width: 150, height: 160),
                          const SizedBox(height: 10),
                          const Text(
                            'Enter your Mobile Number',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'We will send  OTP to the registered', style: TextStyle(fontSize: 17,),
                          ),
                          const Text(
                            'Mobile Number', style: TextStyle(fontSize: 16,),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(decoration: BoxDecoration(
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
                              child: TextField(controller: phonecontroller,
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
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(height: 60,
                              child: ElevatedButton(
                                onPressed: () async{await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential){},
                                    verificationFailed: (FirebaseAuthException ex){},
                                    codeSent: (String verificationid,int? resendtoken){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Otp(verificationid: verificationid,)),
                                      );
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId){},phoneNumber:phonecontroller.text.toString() );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero , // Remove padding so the image fits correctly
                                  primary: Colors.transparent,backgroundColor: Colors.transparent, // Make the button background transparent
                                  shadowColor: Colors.transparent, // Remove the shadow
                                ),
                                child: Image.asset(
                                  'asset/image/5.png',
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
