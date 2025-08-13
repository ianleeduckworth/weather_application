import 'package:flutter/material.dart';
import 'package:weather_application/utilities/get_conditions.dart';

Widget getWeatherIcon(WeatherCondition conditions, bool isDay) {
  if (conditions == WeatherCondition.clear) {
    if (isDay) {
      return Icon(Icons.wb_sunny, color: Colors.amber);
    } else {
      return Icon(Icons.nightlight_round, color: Colors.blueGrey);
    }
  }

  if (conditions == WeatherCondition.cloudy) {
    return Icon(Icons.wb_cloudy, color: Colors.grey);
  }

  if (conditions == WeatherCondition.rainy) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 20),
          ),
          Positioned(
            top: 12,
            left: 2,
            child: Icon(Icons.water_drop, color: Colors.blue, size: 8),
          ),
          Positioned(
            top: 16,
            left: 8,
            child: Icon(Icons.water_drop, color: Colors.blue, size: 8),
          ),
          Positioned(
            top: 12,
            left: 14,
            child: Icon(Icons.water_drop, color: Colors.blue, size: 8),
          ),
        ],
      ),
    );
  }

  if (conditions == WeatherCondition.drizzle) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 20),
          ),
          Positioned(
            top: 16,
            left: 8,
            child: Icon(Icons.water_drop, color: Colors.blue, size: 8),
          ),
        ],
      ),
    );
  }

  if (conditions == WeatherCondition.foggy) {
    return Icon(Icons.foggy, color: Colors.blueGrey);
  }

  if (conditions == WeatherCondition.stormy) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 20),
          ),
          Positioned(
            top: 6,
            left: 4,
            child: Icon(Icons.bolt, color: Colors.amber, size: 22),
          ),
        ],
      ),
    );
  }

  if (conditions == WeatherCondition.snowy) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 20),
          ),
          Positioned(
            top: 8,
            left: 6,
            child: Icon(Icons.ac_unit, color: Colors.blue, size: 16),
          ),
        ],
      ),
    );
  }

  if (conditions == WeatherCondition.dusty) {
    return Icon(Icons.air, color: Colors.deepOrange);
  }

  if (conditions == WeatherCondition.smokey) {
    return (Icon(Icons.fireplace, color: Colors.red.shade50));
  }

  if (conditions == WeatherCondition.partlyCloudy) {
    return (Stack(
      children: [
        isDay
            ? Icon(Icons.wb_sunny, color: Colors.amber, size: 24)
            : Icon(Icons.nightlight_round, color: Colors.blueGrey, size: 24),
        Positioned(
          top: 8,
          left: 8,
          child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 16),
        ),
      ],
    ));
  }

  if (conditions == WeatherCondition.hail) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Icon(Icons.wb_cloudy, color: Colors.grey, size: 20),
          ),
          Positioned(
            top: 8,
            left: 6,
            child: Icon(Icons.circle, color: Colors.blue, size: 16),
          ),
        ],
      ),
    );
  }

  return Icon(Icons.question_mark, color: Colors.black);
}
