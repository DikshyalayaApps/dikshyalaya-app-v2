import 'package:dikshyalaya_v2/core/api/api_client.dart';
import 'package:dikshyalaya_v2/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:dikshyalaya_v2/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dikshyalaya_v2/features/splash/presentation/screens/splash_screen.dart';
import 'package:dikshyalaya_v2/app/app_routes.dart'; // Updated import path

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

   final onboardingRepository = OnboardingRepository(ApiClient().dio);
   late final GetOnboardingSlides getOnboardingSlides = GetOnboardingSlides(onboardingRepository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // Define the onboarding route dynamically using getOnboardingSlides
         ...getAppRoutes(getOnboardingSlides),
      },
    );
  }
}
