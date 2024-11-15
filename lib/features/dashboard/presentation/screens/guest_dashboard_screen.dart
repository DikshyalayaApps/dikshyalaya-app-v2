import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/blurred_backdrop_image.dart';
import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/collapsed_app_bar_content.dart';
import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/expanded_app_bar_content.dart';
import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/page_body_widget.dart';
import 'package:dikshyalaya_v2/features/dashboard/presentation/widgets/slide_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GuestDashboardScreen extends HookWidget {
  const GuestDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 80.0;
    const expandedBarHeight = 400.0;

    final scrollController = useScrollController();
    final isCollapsed = useState(false);

    // Add a listener to limit the scroll offset
    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.hasClients) {
          final maxOffset = expandedBarHeight - collapsedBarHeight;
          if (scrollController.offset > maxOffset) {
            // Smoothly scroll back to max offset
            scrollController.animateTo(
              maxOffset,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          }
        }
      });
      return scrollController.dispose;
    }, [scrollController]);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        isCollapsed.value = scrollController.hasClients &&
            scrollController.offset >= (expandedBarHeight - collapsedBarHeight);
        return true;
      },
      child: Stack(
        children: [
          BlurredBackdropImage(),
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: expandedBarHeight,
                collapsedHeight: collapsedBarHeight,
                centerTitle: false,
                pinned: true,
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isCollapsed.value ? 1 : 0,
                  child: CollapsedAppBarContent(),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                // leading: const BackButton(
                //   color: Colors.white,
                // ),
                flexibleSpace: FlexibleSpaceBar(
                  background: ExpandedAppBarContent(),
                ),
              ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Material(
                    elevation: 7,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: PageBodyWidget(),
                  ),
                ),
              )
            ],
          ),
           SlidingPanelWidget(
            maxHeight: 350, //MediaQuery.of(context).size.height * 0.5,
            minHeight:200,
          ),
        
        ],
      ),
    );
  }
}
