// lib/presentation/navigation/slide_page_route.dart
import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final String direction;
  final Duration duration;  // Add a duration parameter

  SlidePageRoute({
    required this.page,
    this.direction = 'right',
    this.duration = const Duration(milliseconds: 500), // Default duration is 600ms
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,  // Set the transition duration
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Determine the offset based on direction
            Offset begin;
            switch (direction) {
              case 'left':
                begin = Offset(-1.0, 0.0);
                break;
              case 'top':
                begin = Offset(0.0, -1.0);
                break;
              case 'bottom':
                begin = Offset(0.0, 1.0);
                break;
              case 'right':
              default:
                begin = Offset(1.0, 0.0); // Default: slide from right
                break;
            }

            const end = Offset.zero; // End position is the center of the screen
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
