import 'package:flutter/material.dart';

class GuestDashboardScreen extends StatelessWidget {
  const GuestDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Dashboard Screen'),
      ),
      body: const SafeArea(child: Center(
        child: Text(
          'Welcome to the Guest Dashboard Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),) 
    );
  }
}
