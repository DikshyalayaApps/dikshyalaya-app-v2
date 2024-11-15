// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:dikshyalaya_v2/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashAnimation extends StatefulWidget {
  final Widget child;

  const SplashAnimation({super.key, required this.child});

  @override
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
      duration: const Duration(seconds: 8),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _flipCount++;
          if (_flipCount >= 2) {
            // Optionally delay the navigation after all flips are done
            Future.delayed(const Duration(seconds: 1), () {
               _navigateBasedOnFirstTime();
            });
            _controller.stop();
          } else {
            _controller.forward(from: 0); // Restart for the next flip
          }
        }
      });

    // Set the animation to do a full 360-degree (2 * pi) rotation
    _flipAnimation = Tween<double>(end: 0, begin: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the animation
  }

   Future<void> _navigateBasedOnFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('first_time') ?? true;

    // Navigate to either the onboarding or dashboard based on first-time check
    if (isFirstTime) {
      // Navigate to Onboarding
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    } else {
      // Navigate to Dashboard
      Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
    }
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
