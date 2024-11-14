// domain/usecases/get_onboarding_slides.dart
import '../../data/models/onboarding_slide_model.dart';
import '../../data/repositories/onboarding_repository.dart';

class GetOnboardingSlides {
  final OnboardingRepository repository;

  GetOnboardingSlides(this.repository);

  Future<List<OnboardingSlideModel>> call() async {
    return await repository.fetchSlides();
  }
}
