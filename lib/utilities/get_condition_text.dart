import 'package:weather_application/utilities/get_conditions.dart';

/// Gets a human readable value for a specific WeatherCondition enum value
String getConditionText(WeatherCondition weatherCondition) {
  switch (weatherCondition) {
    case WeatherCondition.clear:
      return "Clear";
    case WeatherCondition.cloudy:
      return "Cloudy";
    case WeatherCondition.drizzle:
      return "Drizzle";
    case WeatherCondition.dusty:
      return "Dust";
    case WeatherCondition.foggy:
      return "Fog";
    case WeatherCondition.partlyCloudy:
      return "Part Cl";
    case WeatherCondition.rainy:
      return "Rain";
    case WeatherCondition.smokey:
      return "Smoke";
    case WeatherCondition.snowy:
      return "Snow";
    case WeatherCondition.stormy:
      return "Storms";
    case WeatherCondition.hail:
      return "Hail";
    default:
      return "Unknown";
  }
}
