import 'package:flutter/material.dart';
import 'dart:ui';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false, // Prevent resizing when the keyboard appears
        body: OverlayPage(),
      ),
    );
  }
}
class OverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Keep the background transparent
      body: Stack(
        children: [
          // Background blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Adjust for keyboard
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 340,
                    height: 510,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.red),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              
                              maxLines: 14,
                              minLines: 10,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: 'Please mention how we can help you',
                                hintStyle: const TextStyle(color: Colors.red),

                                fillColor: Colors.red.withOpacity(0.5),
                                filled: true,
                                border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red ),
                                  borderRadius: BorderRadius.circular(14),

                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180, // Adjust this value for the overlap
            left: 40,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 100),
                Image.asset(
                  'asset/image/support.png',
                  width: 180,
                  height: 150, // Adjust the height to overlap more or less
                ),
                const SizedBox(width: 20), // Space between the images
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'asset/image/Vector.png', // Replace with your image path
                    width: 100,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
