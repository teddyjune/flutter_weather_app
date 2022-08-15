import 'package:flutter/material.dart';
import 'package:weather_app/weather_api.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();

  String cityName = '';
  Iterable weather = [];
  Map<String, dynamic> tempList = {};
  String icon = '';

  void fetchWeatherInfo(String query) async {
    cityName = await _weatherApi.getCityName(query);
    weather = await _weatherApi.getWeather(query);
    tempList = await _weatherApi.getTemp(query);
    icon = await _weatherApi.getIcon(query);
    notifyListeners();
  }

  convertTemp(temperature) {
    return (temperature - 273.15).toFixed(1);
  }
}
