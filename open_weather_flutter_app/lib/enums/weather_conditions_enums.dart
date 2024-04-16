
enum WeatherCondition {
  rainy,
  cloudy,
  sunny;

  static WeatherCondition fromStringtoEnum(String weatherCondition) {
    if (weatherCondition.contains("rain")) {
      return WeatherCondition.rainy;
    } else if (weatherCondition.contains("clear")) {
      return WeatherCondition.sunny;
    } else if (weatherCondition.contains("cloud")) {
      return WeatherCondition.cloudy;
    } else {
      return WeatherCondition.sunny;
    }
  }
}
