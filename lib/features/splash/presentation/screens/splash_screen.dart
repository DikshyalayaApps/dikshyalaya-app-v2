// import 'package:dikshyalaya_v2/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:dikshyalaya_v2/core/constants/colors.dart';
import 'package:dikshyalaya_v2/features/splash/presentation/widgets/splash_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //AppLocalizations.of(context)?.loadScreenLocalization('splash_screen');

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: SplashAnimation(
          child: Container(
              width: 256, // Adjust based on logo size
              height: 256,
              decoration: const BoxDecoration(
                //shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain, // Ensures the entire image is visible within the border
                ),
              ),
            ),
        ),
      ),
    );
  }
}
