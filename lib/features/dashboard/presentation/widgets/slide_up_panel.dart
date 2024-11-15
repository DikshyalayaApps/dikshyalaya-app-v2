import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class SlidingPanelWidget extends StatelessWidget {
  final double minHeight;
  final double maxHeight;

  const SlidingPanelWidget({
    super.key,
    this.minHeight = 100,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panelBuilder: () {
        return Column(
          children: [
            // Header widget at the top of the panel
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue, // Header background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Panel Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      // Close the panel when pressed
                      PanelController().close();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Space between header and grid
            // Grid of icons
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,  // 4 icons per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 8,  // Number of icons in the grid
                itemBuilder: (BuildContext context, int index) {
                  final icons = [
                    Icons.home,
                    Icons.search,
                    Icons.notifications,
                    Icons.settings,
                    Icons.info,
                    Icons.account_circle,
                    Icons.favorite,
                    Icons.language,
                  ];
                  final labels = [
                    'Home',
                    'Search',
                    'Notifications',
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
                          Navigator.pushNamed(context, '/notifications');
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
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 12, // Smaller font size
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      minHeight: minHeight,
      maxHeight: maxHeight,
      parallaxEnabled: true,
      parallaxOffset: 0.2,
    );
  }
}
