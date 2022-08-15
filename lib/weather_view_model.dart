import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_api.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();

  String cityName = '';
  List<Weather> weatherList = [];
  Map<String, dynamic> tempList = {};
  String icon = '';

  void fetchWeatherInfo(String query) async {
    cityName = await _weatherApi.getCityName(query);
    print(cityName);
    weatherList = await _weatherApi.getWeather(query);
    tempList = await _weatherApi.getTemp(query);
    print(tempList);
    icon = await _weatherApi.getIcon(query);
    notifyListeners();
  }

  convertTemp(F) {
    return (F - 273.15).toFixed(1);
  }

  String getCurrentTemp() {
    return convertTemp(tempList[0]);
  }
}
