import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/outlined_chip.dart';
import 'package:flutter/material.dart';

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Material(
            borderRadius: BorderRadius.circular(
              50,
            ),
            elevation: 7,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/icon.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Title Text",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // Text(
        //   "Tagline Text",
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 15,
        //     fontWeight: FontWeight.normal,
        //   ),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     OutlinedChip(
        //       label: "3.4",
        //       icon: const Icon(
        //         Icons.star,
        //         color: Colors.white,
        //         size: 20,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     OutlinedChip(
        //       label: "NEP",
        //       icon: const Icon(
        //         Icons.flag,
        //         color: Colors.white,
        //         size: 20,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     OutlinedChip(
        //       label:
        //           "ENG",
        //       icon: const Icon(
        //         Icons.language,
        //         color: Colors.white,
        //         size: 20,
        //       ),
        //     ),
        //   ],
        // )
      ],
    ));
  }
}
