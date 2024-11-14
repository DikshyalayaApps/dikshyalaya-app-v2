// data/repositories/onboarding_repository.dart
import 'package:dio/dio.dart';
import '../models/onboarding_slide_model.dart';

class OnboardingRepository {
  final Dio dio;

  OnboardingRepository(this.dio);

  Future<List<OnboardingSlideModel>> fetchSlides() async {
    try {
      final response = await dio.get('/onboarding-slides');
      return (response.data as List)
          .map((json) => OnboardingSlideModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load slides');
    }
  }
}
