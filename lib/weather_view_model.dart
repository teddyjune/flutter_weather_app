import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_api.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();
  Weather myWeather = Weather(weather: '', cityName: '', icon: '', temp: 0);
  bool isLoading = true;

  WeatherViewModel() {
    fetchWeatherInfo('seoul');
  }

  void fetchWeatherInfo(String query) async {
    isLoading = true;
    notifyListeners();
    myWeather = await _weatherApi.getWeatherInfo(query);
    isLoading = false;
    notifyListeners();
  }

  String convertTemp(num F) {
    return (F - 273.15).toStringAsFixed(1);
  }
}
