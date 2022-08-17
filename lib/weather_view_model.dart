import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_api.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();
  Weather myWeather = Weather('', '', '', 0);

  void fetchWeatherInfo(String query) async {
    myWeather = await _weatherApi.getWeatherInfo(query);
    notifyListeners();
  }

  convertTemp(double F) {
    return (F - 273.15).toStringAsFixed(1);
  }

  String getCurrentTemp() {
    return convertTemp(tempList[0]);
  }
}
