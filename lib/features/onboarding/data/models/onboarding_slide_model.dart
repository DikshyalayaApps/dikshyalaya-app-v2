// onboarding_slide_model.dart
class OnboardingSlideModel {
  final String title;
  final String description;
  final String image;

  OnboardingSlideModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory OnboardingSlideModel.fromJson(Map<String, dynamic> json) {
    return OnboardingSlideModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
