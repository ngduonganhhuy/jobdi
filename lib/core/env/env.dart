import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get apiKey => dotenv.get('API_KEY');
  static String get baseUrl => dotenv.get('BASE_URL');
  static String get mapboxToken => dotenv.get('MAPBOX_TOKEN');
  static num get hotline => dotenv.getInt('HOTLINE');
}
