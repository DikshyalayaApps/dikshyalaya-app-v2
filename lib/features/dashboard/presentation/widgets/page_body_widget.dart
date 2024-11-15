// import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/favorite_button_widget.dart';
// import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/watch_now_button_widget.dart';
import 'package:flutter/material.dart';

/// Shows the body of the movie details
///includes the watch now, favorite buttons and the movie introduction
class PageBodyWidget extends StatelessWidget {
  const PageBodyWidget({
    super.key
  });  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: const [
          //     Expanded(
          //       child: WatchNowButtonWidget(),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     FavoriteButtonWidget(),
          //   ],
          // ),
          // const Divider(),
          const SizedBox(
            height: 10,
          ),
          // Introduction title
          const Text(
            'Introduction',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Overview details content goes here",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}