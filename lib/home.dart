import 'package:flutter/material.dart';
import 'package:ludokhell/playonline.dart';
import 'dart:ui';
import 'package:ludokhell/profile1.dart';
import 'package:ludokhell/view2.dart'; // Needed for BackdropFilter

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  void _showOverlay() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              // Background blur
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0), // Transparent background
                  ),
                ),
              ),
              // Container with new content
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 340,
                  height: 490,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const SizedBox(height: 30),
                      Container(
                      width: 290,
                      height: 65 ,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                        child: Row(
                          children: [const SizedBox(width: 10),const Text('My Profile ',style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFEc0000),
                            fontWeight: FontWeight.bold
                          ),),const SizedBox(width: 90),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false, // So the underlying screen is visible
                                    pageBuilder: (BuildContext context, _, __) => OverlayPage(),
                                  ),
                                );
                              },
                              child: const Image(
                                height: 100,
                                width: 85,
                                image: AssetImage('asset/image/VIEW.png'),
                              ),
                            ),
                          ],
                        ),
                    ),const SizedBox(height: 15,),
                      Container(
                        width: 290,
                        height: 65 ,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [const SizedBox(width: 10),const Text('Support ',style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFEc0000),
                              fontWeight: FontWeight.bold
                          ),),const SizedBox(width: 110),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false, // So the underlying screen is visible
                                    pageBuilder: (BuildContext context, _, __) => Overlayview(),
                                  ),
                                );
                              },
                              child: const Image(height: 100,
                                  width: 85,image: AssetImage( 'asset/image/CONTACT.png',)),
                            ),
                          ],
                        ),
                      ),const SizedBox(height: 10,),
                      Container(
                        width: 290,
                        height: 65 ,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [SizedBox(width: 10),Text(' Sound ',style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFEc0000),
                              fontWeight: FontWeight.bold
                          ),),
                          ],
                        ),
                      ),const SizedBox(height: 17,),
                      Container(
                        width: 290,
                        height: 65 ,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [SizedBox(width: 10),Text(' Vibration ',style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFEc0000),
                              fontWeight: FontWeight.bold
                          ),),
                          ],
                        ),
                      ),const SizedBox(height: 50,),
                      Container(height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                            ),
                          ),
                          child: Container(
                            height: 40,
                            width: 150,
                            child: const Image(
                              image: AssetImage('asset/image/logout.png'),
                              fit: BoxFit.fill, // Ensures the image covers the entire button area
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 115, // Adjust this value for the overlap
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 110),Image.asset(
                      'asset/image/7.png', // Replace with your image path
                      width: 140, // Adjust the width as needed
                      height: 155, // Adjust the height to overlap more or less
                    ),
                    const SizedBox(width: 62), // Space between the images
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'asset/image/Vector.png', // Replace with your image path
                        width: 50,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'asset/image/p7.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 80,
                  width: 490,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEc0000),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ClipOval(
                        child: Image.asset(
                          'asset/image/profile.png',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),const SizedBox(width: 193 ,),
                      const Image(image: AssetImage('asset/image/top2.png',),width: 100,height: 60),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: _showOverlay, // Trigger the blur effect and new content
                        child: Image.asset(
                          'asset/image/home.png',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Image.asset(
                'asset/image/3.png',
                width: 140,
                height: 130  ,
              ),
              const SizedBox(height: 1),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(8),
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false, // So the underlying screen is visible
                            pageBuilder: (BuildContext context, _, __) => Po(),
                          ),
                        );
                      },
                          child: Image.asset('asset/image/po.png', width: 40, height: 50)),
                      Image.asset('asset/image/pf.png', width: 30, height: 50),
                      Image.asset('asset/image/bot.png', width: 30, height: 50),
                      Image.asset('asset/image/pass and play.png', width: 30, height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}
