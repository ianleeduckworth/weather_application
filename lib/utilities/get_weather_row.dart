import 'package:weather_application/data/raw_daily.dart';
import 'package:weather_application/data/raw_hourly.dart';
import 'package:weather_application/data/weather_row.dart';
import 'package:weather_application/utilities/get_conditions.dart';

HourlyRow getHourlyRow(RawHourly rawWeather, int hourIndex) {
  final hourly = rawWeather.hourly;

  final isDay = hourly.isDay[hourIndex];
  final weatherCode = hourly.weatherCode[hourIndex];
  final time = hourly.time[hourIndex];
  final temp = hourly.temperature[hourIndex];
  final precipAmount = hourly.precipitation[hourIndex];
  final precipPercent = hourly.precipitationProbability[hourIndex];
  final dewPoint = hourly.dewPoint[hourIndex];

  return HourlyRow(
    isDay: isDay != 0,
    time: time,
    conditions: getConditions(weatherCode),
    temp: temp.round(),
    precipAmount: precipAmount,
    percipPercent: precipPercent,
    dewPoint: dewPoint.round(),
  );
}

DailyRow getDailyRow(RawDaily rawDaily, int dailyIndex) {
  final daily = rawDaily.daily;
  final time = daily.time[dailyIndex];
  final weatherCode = daily.weatherCode[dailyIndex];
  final tempMin = daily.tempMin[dailyIndex];
  final tempMax = daily.tempMax[dailyIndex];
  final percipProb = daily.percipProb[dailyIndex];

  return DailyRow(
    time: time,
    conditions: getConditions(weatherCode),
    tempMin: tempMin,
    tempMax: tempMax,
    percipProb: percipProb,
  );
}
