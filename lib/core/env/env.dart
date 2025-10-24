class Env {
  static String get apiKey => const bool.hasEnvironment('API_KEY')
      ? const String.fromEnvironment('API_KEY')
      : '';
  static String get baseUrl => const bool.hasEnvironment('BASE_URL')
      ? const String.fromEnvironment('BASE_URL')
      : '';
  static String get mapboxToken => const bool.hasEnvironment('MAPBOX_TOKEN')
      ? const String.fromEnvironment('MAPBOX_TOKEN')
      : '';
}
