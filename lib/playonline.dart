import 'package:flutter/material.dart';
import 'package:ludokhell/player2,4.dart';
import 'dart:ui';

import 'package:ludokhell/switch.dart';

import 'Counter.dart';
import 'crown selection.dart'; // For ImageFilter

class Po extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Apply blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.1), // Slight tint if needed
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 340,
              height: 504,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const CustomSwitches(), // Replace the container with CustomSwitches
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 80,

                      child: MyApppp(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Counter(),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const CustomSwitches2(),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'asset/image/844.png', // Replace with your image path
                      width: 130,
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 220, // Adjust this value for the overlap
          left: 40,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 100),
              Image.asset(
                'asset/image/879.png',
                width: 180,
                height: 100, // Adjust the height to overlap more or less
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Po(),
  ));
}
