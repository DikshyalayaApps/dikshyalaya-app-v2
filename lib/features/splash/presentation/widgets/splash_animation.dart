import 'dart:math';
import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  final Widget child;

  const SplashAnimation({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  int _flipCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _flipCount++;
          if (_flipCount >= 4) {
            // Stop after two full flips
            _controller.stop();
          } 
          // else {
          //   _controller.forward(from: 0); // Restart for the next flip
          // }
        }
      });

    // Set the animation to do a full 360-degree (2 * pi) rotation
    _flipAnimation = Tween<double>(end: 0, begin: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the animation 

    CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Navigate to the next screen when the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       // Navigator.of(context).pushReplacementNamed('/home'); // Replace with your home screen route
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateY(_flipAnimation.value), // Rotate forward around Y-axis
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
