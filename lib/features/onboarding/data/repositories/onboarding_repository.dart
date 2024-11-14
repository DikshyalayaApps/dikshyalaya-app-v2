import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/onboarding_slide_model.dart';

class OnboardingRepository {
  final Dio apiClient;

  // Constructor to initialize the ApiClient
  OnboardingRepository(this.apiClient);

  //Fetching the onboarding slides using the ApiClient
  Future<List<OnboardingSlideModel>> fetchSlides() async {
    try {
      final response = await apiClient.get('/on-boarding-screen');    
      // Check if the response is successful and contains the 'data' field
      if ( response.data['success'] == true ) {
        
        // Map the 'data' field to a list of OnboardingSlideModel objects
        return (response.data['data'] as List)
            .map((json) => OnboardingSlideModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load slides: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('Failed to load slides major: $e');
    }
  }
}
