import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherRepository = WeatherRepository();
  Weather myWeather = Weather(weather: '', cityName: '', icon: '', temp: 0);
  bool isLoading = true;

  WeatherViewModel() {
    fetchWeatherInfo('seoul');
  }

  void fetchWeatherInfo(String query) async {
    isLoading = true;
    notifyListeners();
    myWeather = await _weatherRepository.getWeatherInfo(query);
    isLoading = false;
    notifyListeners();
  }

  String convertTemp(num F) {
    return (F - 273.15).toStringAsFixed(1);
  }
}
