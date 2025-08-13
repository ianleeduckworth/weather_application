class RawDaily {
  final double latitude;
  final double longitude;
  final double elevation;
  final Daily daily;

  RawDaily({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.daily,
  });

  factory RawDaily.fromJson(Map<String, dynamic> json) {
    return RawDaily(
      latitude: json['latitude'],
      longitude: json['longitude'],
      elevation: json['elevation'],
      daily: Daily.fromJson(json['daily']),
    );
  }
}

class Daily {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> tempMin;
  final List<double> tempMax;
  final List<int> percipProb;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.tempMin,
    required this.tempMax,
    required this.percipProb,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawTime = json['time'];
    final List<dynamic> rawWeatherCode = json['weather_code'];
    final List<dynamic> rawTempMin = json['temperature_2m_min'];
    final List<dynamic> rawTempMax = json['temperature_2m_max'];
    final List<dynamic> rawPercipProb = json['precipitation_probability_max'];

    return Daily(
      time: rawTime.map((item) => item as String).toList(),
      weatherCode: rawWeatherCode.map((item) => item as int).toList(),
      tempMin: rawTempMin.map((item) => item as double).toList(),
      tempMax: rawTempMax.map((item) => item as double).toList(),
      percipProb: rawPercipProb.map((item) => item as int).toList(),
    );
  }
}
