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
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
