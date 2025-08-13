enum WeatherCondition {
  clear,
  cloudy,
  partlyCloudy,
  rainy,
  drizzle,
  snowy,
  stormy,
  foggy,
  smokey,
  dusty,
  hail,
  unknown,
}

// https://www.nodc.noaa.gov/archive/arc0021/0002199/1.1/data/0-data/HTML/WMO-CODE/WMO4677.HTM

WeatherCondition getConditions(int weatherCode) {
  if (weatherCode >= 0 && weatherCode <= 1) {
    return WeatherCondition.clear;
  }
  if (weatherCode == 2) {
    return WeatherCondition.partlyCloudy;
  }
  if (weatherCode == 3) {
    return WeatherCondition.cloudy;
  }

  if (weatherCode == 4) {
    return WeatherCondition.smokey;
  }

  if (weatherCode == 5) {
    return WeatherCondition.foggy;
  }

  if (weatherCode >= 6 && weatherCode <= 9) {
    return WeatherCondition.dusty;
  }

  if (weatherCode >= 10 && weatherCode <= 12) {
    return WeatherCondition.drizzle;
  }

  if (weatherCode >= 13 && weatherCode <= 19) {
    return WeatherCondition.stormy;
  }

  if (weatherCode == 20 || weatherCode == 21) {
    return WeatherCondition.rainy;
  }

  if (weatherCode >= 22 && weatherCode <= 24) {
    return WeatherCondition.snowy;
  }

  if (weatherCode == 25) {
    return WeatherCondition.rainy;
  }

  if (weatherCode == 26) {
    return WeatherCondition.snowy;
  }

  if (weatherCode == 27) {
    return WeatherCondition.rainy;
  }

  if (weatherCode == 28) {
    return WeatherCondition.foggy;
  }

  if (weatherCode == 29) {
    return WeatherCondition.stormy;
  }

  if (weatherCode >= 30 && weatherCode <= 35) {
    return WeatherCondition.dusty;
  }

  if (weatherCode >= 36 && weatherCode <= 39) {
    return WeatherCondition.snowy;
  }

  if (weatherCode >= 40 && weatherCode <= 49) {
    return WeatherCondition.foggy;
  }

  if (weatherCode >= 50 && weatherCode <= 59) {
    return WeatherCondition.drizzle;
  }

  if (weatherCode >= 60 && weatherCode <= 69) {
    return WeatherCondition.rainy;
  }

  if (weatherCode >= 70 && weatherCode <= 79) {
    return WeatherCondition.snowy;
  }

  // if (weatherCode >= 80 && weatherCode <= 89) {
  //   return WeatherCondition.stormy;
  // }

  if (weatherCode >= 80 && weatherCode <= 82) {
    return WeatherCondition.rainy;
  }

  if (weatherCode >= 83 && weatherCode <= 88) {
    return WeatherCondition.snowy;
  }

  if (weatherCode >= 89 && weatherCode <= 90) {
    return WeatherCondition.hail;
  }

  if (weatherCode >= 91 && weatherCode <= 92) {
    return WeatherCondition.rainy;
  }

  if (weatherCode >= 93 && weatherCode <= 94) {
    return WeatherCondition.snowy;
  }

  if (weatherCode >= 95 && weatherCode <= 99) {
    return WeatherCondition.stormy;
  }

  // this line should never be hit but if we can't figure out what the conditions are then we'll fall back to unknown
  return WeatherCondition.unknown;
}
