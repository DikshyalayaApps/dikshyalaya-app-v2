// onboarding_slide_model.dart
class OnboardingSlideModel {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingSlideModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory OnboardingSlideModel.fromJson(Map<String, dynamic> json) {
    return OnboardingSlideModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}
