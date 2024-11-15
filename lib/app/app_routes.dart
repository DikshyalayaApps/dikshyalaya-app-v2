// core/navigation/app_routes.dart

// ignore_for_file: use_build_context_synchronously

import 'package:dikshyalaya_v2/core/navigation/slide_page_route.dart';
import 'package:dikshyalaya_v2/features/dashboard/presentation/screens/guest_dashboard_screen.dart';
import 'package:dikshyalaya_v2/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/onboarding/domain/usecases/get_onboarding_slides.dart';

// Define route names as constants
class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String guestdashboard = '/guestdashboard';
}

// Define a function to return the routes map
Map<String, WidgetBuilder> getAppRoutes(
    GetOnboardingSlides getOnboardingSlides) {
  return {
    AppRoutes.onboarding: (context) => OnboardingScreen(
          getOnboardingSlides: getOnboardingSlides,
          onSkip: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('first_time', false);
            //Navigator.of(context).pushReplacementNamed(AppRoutes.guestdashboard);
            // Use SlidePageRoute for navigation
            Navigator.of(context).pushReplacement(
              SlidePageRoute(
                  page: const GuestDashboardScreen(),
                  direction: 'right', // Choose direction (e.g., 'left' or 'right')
                  duration: Duration(milliseconds: 800)),
            );
          },
        ),
    AppRoutes.guestdashboard: (context) => const GuestDashboardScreen(),
  };
}
