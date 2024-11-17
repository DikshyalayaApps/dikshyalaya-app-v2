// core/config/config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl {
    final url = dotenv.env['BASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception("BASE_URL is not defined in the .env file");
    }
    return url;
  }

  static String get appId {
    final id = dotenv.env['APP_ID'];
    if (id == null || id.isEmpty) {
      throw Exception("APP_ID is not defined in the .env file");
    }
    return id;
  } 

  // Add other environment-specific getters if needed
}
