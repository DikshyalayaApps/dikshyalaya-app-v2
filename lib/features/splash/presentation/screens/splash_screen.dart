import 'package:flutter/material.dart';
import 'package:dikshyalaya_v2/core/constants/colors.dart';
import 'package:dikshyalaya_v2/features/splash/presentation/widgets/splash_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: SplashAnimation(
          child: Container(
            padding: const EdgeInsets.all(8.0), // Space between border and logo
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.0), // White circular border
            ),
            child: Container(
              width: 150, // Adjust based on logo size
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain, // Ensures the entire image is visible within the border
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}