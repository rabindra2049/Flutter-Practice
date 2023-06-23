class ConfigFile {
  static const baseUrl = String.fromEnvironment('BASE_URL',
      defaultValue: "https://api.themoviedb.org/3/");

  static const imageBaseUrl = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/");

  static const imageBaseUrlCover = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w500_and_h282_face/");

  static const apiKey = String.fromEnvironment('API_KEY',
      defaultValue: "709dd7d81d18788a7277683e0c11215f");
}
