// import 'package:dikshyalaya_v2/app/app_localizations.dart';
import 'package:dikshyalaya_v2/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dikshyalaya_v2/core/constants/colors.dart';
import 'package:dikshyalaya_v2/features/splash/presentation/widgets/splash_animation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start timer to navigate to HomeScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still mounted before navigating
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //AppLocalizations.of(context)?.loadScreenLocalization('splash_screen');

//     return Scaffold(
//       backgroundColor: AppColors.darkBlue,
//       body: Center(
//         child: SplashAnimation(
//           child: Container(
//             padding: const EdgeInsets.all(8.0), // Space between border and logo
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                   color: Colors.white, width: 1.0), // White circular border
//             ),
//             child: Container(
//               width: 150, // Adjust based on logo size
//               height: 150,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/logo.png'),
//                   fit: BoxFit.contain, // Ensures the entire image is visible within the border
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
