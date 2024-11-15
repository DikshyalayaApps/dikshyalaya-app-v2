// domain/usecases/get_onboarding_slides.dart
import 'package:dikshyalaya_v2/features/onboarding/data/models/onboarding_slide_model.dart';
import 'package:dikshyalaya_v2/features/onboarding/data/repositories/onboarding_repository.dart';

class GetOnboardingSlides {
  final OnboardingRepository repository;

  GetOnboardingSlides(this.repository);

  Future<List<OnboardingSlideModel>> call() async {
    return await repository.fetchSlides();
  }
}
