import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

class Overlayview extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> _fetchDetails() async {
    DocumentSnapshot doc = await _firestore
        .collection('details')
        .doc('sBV7jEWoXP8KrM5yzh72')
        .get();
    return doc.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Apply blur effect

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.2), // Slight tint for better visibility of the blur effect
              ),
            ),
          ),
          // Add Row with two images overlapping the container
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
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _fetchDetails(),
                  builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(child: Text('No data found.'));
                    }

                    final data = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        const Image(width: 80, height: 90, image: AssetImage('asset/image/Ellipses.png')),
                        const Image(width: 110, height: 50, image: AssetImage('asset/image/change.png')),
                        const SizedBox(height: 20),
                        Container(
                          width: 290,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                ' NAME: ${data['name'] ?? 'Unknown'}',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 290,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                ' Refferal: ${data['referralCode'] ?? 'Unknown'}',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 290,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                ' Email: ${data['emailid'] ?? 'Unknown'}',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        const SizedBox(height: 10),
                        Container(
                          width: 190,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                '     Total wins',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 219,
            left: 26,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 120),
                Image.asset(
                  'asset/image/profilep.png',
                  width: 170,
                  height: 110,
                ),
                const SizedBox(width: 44),
                Image.asset(
                  'asset/image/Vector.png',
                  width: 55,
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
