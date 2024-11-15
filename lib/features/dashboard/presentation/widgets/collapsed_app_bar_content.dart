import 'package:flutter/material.dart';

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Title Text",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          child: Material(
            borderRadius: BorderRadius.circular(
              20,
            ),
            elevation: 7,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/icon.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
