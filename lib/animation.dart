import 'package:flutter/material.dart';

class FallingImageAnimation extends StatefulWidget {
  @override
  _FallingImageAnimationState createState() => _FallingImageAnimationState();
}
class _FallingImageAnimationState extends State<FallingImageAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _fallAnimation;
  late Animation<double> _flipAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fallAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.5), // Start higher above the screen
      end: Offset(0.0, 0.0), // End at the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut, // Slow down towards the end
    ));
    _flipAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0, // 2.0 here represents 360 degrees (a full flip, returning to original orientation)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut, // Slow down towards the end
    ));
    _scaleAnimation = Tween<double>(
      begin: 0.0, // Start smaller
      end: 0.5, // End at normal size
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic, // Slow down towards the end
    ));

    _controller.forward();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SlideTransition(
          position: _fallAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedBuilder(
              animation: _flipAnimation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationY(_flipAnimation.value * 3.14),
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: Image.asset('asset/image/3.png'), // Replace with your image
            ),
          ),
        ),
      ),
    );
  }
}
void main() => runApp(MaterialApp(home: FallingImageAnimation()));
