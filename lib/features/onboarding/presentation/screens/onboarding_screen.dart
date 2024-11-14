// presentation/pages/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/models/onboarding_slide_model.dart';
import '../../domain/usecases/get_onboarding_slides.dart';

class OnboardingScreen extends StatefulWidget {
  final GetOnboardingSlides getOnboardingSlides;
  final VoidCallback onSkip;

  const OnboardingScreen({
    super.key,
    required this.getOnboardingSlides,
    required this.onSkip,
  });

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  List<OnboardingSlideModel> _slides = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSlides();
  }

  Future<void> _loadSlides() async {
    final slides = await widget.getOnboardingSlides.call();
    setState(() {
      _slides = slides;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: widget.onSkip,
            child: const Text('Skip', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      final slide = _slides[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(slide.imageUrl),
                          const SizedBox(height: 20),
                          Text(slide.title, style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 10),
                          Text(slide.description),
                        ],
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: _slides.length,
                  effect: const WormEffect(),
                ),
              ],
            ),
    );
  }
}
