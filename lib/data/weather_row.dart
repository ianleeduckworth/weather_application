import 'package:weather_application/utilities/get_conditions.dart';

class HourlyRow {
  final bool isDay;
  final String time;
  final WeatherCondition conditions;
  final int temp;
  final double precipAmount;
  final int percipPercent;
  final int dewPoint;

  HourlyRow({
    required this.isDay,
    required this.time,
    required this.conditions,
    required this.temp,
    required this.precipAmount,
    required this.percipPercent,
    required this.dewPoint,
  });
}

class DailyRow {
  final String time;
  final WeatherCondition conditions;
  final double tempMin;
  final double tempMax;
  final int percipProb;

  DailyRow({
    required this.time,
    required this.conditions,
    required this.tempMin,
    required this.tempMax,
    required this.percipProb,
  });
}
