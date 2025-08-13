import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/data/raw_daily.dart';
import 'package:weather_application/utilities/fetch_position.dart';

class FetchDailyResponse {
  final RawDaily rawDaily;
  final Position position;

  FetchDailyResponse({required this.rawDaily, required this.position});
}

Future<FetchDailyResponse> fetchDaily() async {
  final currentPosition = await getCurrentPosition();
  final latitude = currentPosition.latitude;
  final longitude = currentPosition.longitude;

  final response = await http.get(
    Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch',
    ),
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    final rawDaily = RawDaily.fromJson(decoded);
    return FetchDailyResponse(rawDaily: rawDaily, position: currentPosition);
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
