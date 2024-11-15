// presentation/pages/onboarding_page.dart
import 'package:dikshyalaya_v2/features/onboarding/data/models/onboarding_slide_model.dart';
import 'package:dikshyalaya_v2/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


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
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setEnabledSystemUIMode(
    //     SystemUiMode.immersiveSticky); // Hides status and navigation bars
    _loadSlides();
    _controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChanged);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadSlides() async {
    final slides = await widget.getOnboardingSlides.call();
    setState(() {
      _slides = slides;
      _loading = false;
    });
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a background color if needed
      body: SafeArea(
        child: Stack(
          children: [
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _slides.length,
                      itemBuilder: (context, index) {
                        final slide = _slides[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.network(
                                  slide.image,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              SmoothPageIndicator(
                                controller: _controller,
                                count: _slides.length,
                                effect: const WormEffect(),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  slide.title,
                                  style: const TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  slide.description,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: widget.onSkip,
                                child: Text(
                                  _currentPage == _slides.length - 1
                                      ? "Get Started"
                                      : "Skip",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
