import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_application/data/raw_hourly.dart';
import 'package:weather_application/utilities/fetch_position.dart';

class FetchHourlyResponse {
  final RawHourly rawHourly;
  final Position position;

  FetchHourlyResponse({required this.rawHourly, required this.position});
}

Future<FetchHourlyResponse> fetchHourly(bool tomorrow) async {
  final currentPosition = await getCurrentPosition();
  final latitude = currentPosition.latitude;
  final longitude = currentPosition.longitude;

  final nowDate = DateTime.now();
  final tomorrowDate = nowDate.add(Duration(days: 1));
  final formatter = DateFormat('yyyy-MM-dd');
  final formattedDate = formatter.format(tomorrow ? tomorrowDate : nowDate);

  final response = await http.get(
    Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=precipitation,precipitation_probability,dew_point_2m,temperature_2m,cloud_cover,snowfall,weather_code&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch&start_date=$formattedDate&end_date=$formattedDate',
    ),
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    final rawHourly = RawHourly.fromJson(decoded);
    return FetchHourlyResponse(rawHourly: rawHourly, position: currentPosition);
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
