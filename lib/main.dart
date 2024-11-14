import 'package:dikshyalaya_v2/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      // Include AppLocalizations.delegate in localizationsDelegates
      localizationsDelegates: [
        AppLocalizations.delegate, // Add AppLocalizations delegate here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
       // Locale('es', ''), // Spanish
      ],
      home: SplashScreen(),
    );
  }
}