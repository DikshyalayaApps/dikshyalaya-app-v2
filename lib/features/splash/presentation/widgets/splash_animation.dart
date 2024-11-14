import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  final Widget child;

  const SplashAnimation({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
