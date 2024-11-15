// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class SlidingPanelWidget extends StatefulWidget {
  final double minHeight;
  final double maxHeight;

  const SlidingPanelWidget({
    super.key,
    this.minHeight = 100,
    required this.maxHeight,
  });

  @override
  _SlidingPanelWidgetState createState() => _SlidingPanelWidgetState();
}

class _SlidingPanelWidgetState extends State<SlidingPanelWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a loop
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat(reverse: true);  // Make the animation loop

    // The animation that will drive the gradient transition
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panelBuilder: () {
        return Column(
          children: [
            // Header widget at the top of the panel
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   color: Colors.blue, // Header background color
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'Panel Header',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //             decoration: TextDecoration.none, // Ensure no underline
            //         ),
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.close, color: Colors.white),
            //         onPressed: () {
            //           // Close the panel when pressed
            //           PanelController().close();
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            //const SizedBox(height: 10), // Space between header and grid
            // Animated gradient background for the grid
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  // Define color stops for the gradient
                  Color colorStart = Color.lerp(Colors.blue, Colors.purple, _animation.value)!;
                  Color colorEnd = Color.lerp(Colors.green, Colors.orange, _animation.value)!;

                  return Container(
                    decoration: BoxDecoration(
                       borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                      gradient: LinearGradient(
                        colors: [colorStart, colorEnd],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: GridView.builder(
                      
                      padding: const EdgeInsets.all(15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,  // 4 icons per row
                        crossAxisSpacing:1,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 8,  // Number of icons in the grid
                      itemBuilder: (BuildContext context, int index) {
                        final icons = [
                          Icons.home,
                          Icons.search,
                          Icons.newspaper,
                          Icons.settings,
                          Icons.info,
                          Icons.account_circle,
                          Icons.favorite,
                          Icons.language,
                        ];
                        final labels = [
                          'Home',
                          'Search',
                          'News',
                          'Settings',
                          'Info',
                          'Profile',
                          'Favorites',
                          'Language',
                        ];

                        return GestureDetector(
                          onTap: () {
                            // Handle icon tap and navigation
                            switch (index) {
                              case 0:
                                Navigator.pushNamed(context, '/home');
                                break;
                              case 1:
                                Navigator.pushNamed(context, '/search');
                                break;
                              case 2:
                                Navigator.pushNamed(context, '/news');
                                break;
                              case 3:
                                Navigator.pushNamed(context, '/settings');
                                break;
                              case 4:
                                Navigator.pushNamed(context, '/info');
                                break;
                              case 5:
                                Navigator.pushNamed(context, '/profile');
                                break;
                              case 6:
                                Navigator.pushNamed(context, '/favorites');
                                break;
                              case 7:
                                Navigator.pushNamed(context, '/language');
                                break;
                            }
                          },
                          child: Column(
                            
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                icons[index],
                                size: 40,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                labels[index],
                                style: TextStyle(
                                  fontSize: 12, // Smaller font size
                                  color: Colors.white, // Optional: Adjust text color
                                  decoration: TextDecoration.none, // Ensure no underline
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      minHeight: widget.minHeight,
      maxHeight: widget.maxHeight,
      parallaxEnabled: false,
      parallaxOffset: 0.2,
    );
  }
}
