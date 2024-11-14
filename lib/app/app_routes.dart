// core/navigation/app_routes.dart

import 'package:dikshyalaya_v2/features/dashboard/presentation/screens/home_screen.dart';
import 'package:dikshyalaya_v2/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../../features/onboarding/domain/usecases/get_onboarding_slides.dart';

// Define route names as constants
class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
}

// Define a function to return the routes map
Map<String, WidgetBuilder> getAppRoutes(GetOnboardingSlides getOnboardingSlides) {
  return {
    AppRoutes.onboarding: (context) => OnboardingScreen(
          getOnboardingSlides: getOnboardingSlides,
          onSkip: () => Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard),
        ),
    AppRoutes.dashboard: (context) => const HomeScreen(),
  };
}
