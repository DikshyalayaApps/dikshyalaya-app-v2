import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackdropImage extends StatelessWidget {
  const BlurredBackdropImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 59, 115, 212).withOpacity(0.4),
            ),
          )),
    );
  }
}
