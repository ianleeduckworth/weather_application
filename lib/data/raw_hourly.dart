class RawHourly {
  final double latitude;
  final double longitude;
  final double elevation;
  final Hourly hourly;

  RawHourly({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.hourly,
  });

  factory RawHourly.fromJson(Map<String, dynamic> json) {
    return RawHourly(
      latitude: json['latitude'],
      longitude: json['longitude'],
      elevation: json['elevation'],
      hourly: Hourly.fromJson(json['hourly']),
    );
  }
}

class Hourly {
  final List<String> time;
  final List<double> precipitation;
  final List<int> precipitationProbability;
  final List<double> dewPoint;
  final List<double> temperature;
  final List<int> weatherCode;

  Hourly({
    required this.time,
    required this.precipitation,
    required this.precipitationProbability,
    required this.dewPoint,
    required this.temperature,
    required this.weatherCode,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawTime = json['time'];
    final List<dynamic> rawPrecipitation = json['precipitation'];
    final List<dynamic> rawPrecipitationProbability =
        json['precipitation_probability'];
    final List<dynamic> rawDewPoint = json['dew_point_2m'];
    final List<dynamic> rawTemperature = json['temperature_2m'];
    final List<dynamic> rawWeatherCode = json['weather_code'];

    return Hourly(
      time: rawTime.map((item) => item as String).toList(),
      precipitation: rawPrecipitation.map((item) => item as double).toList(),
      precipitationProbability: rawPrecipitationProbability
          .map((item) => item as int)
          .toList(),
      dewPoint: rawDewPoint.map((item) => item as double).toList(),
      temperature: rawTemperature.map((item) => item as double).toList(),
      weatherCode: rawWeatherCode.map((item) => item as int).toList(),
    );
  }
}
