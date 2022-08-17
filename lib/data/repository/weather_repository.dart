import 'package:weather_app/data/data_source/open_weather_api.dart';
import 'package:weather_app/data/model/weather.dart';

class WeatherRepository {
  final _api = OpenWeatherApi();

  Future<Weather> getWeatherInfo(String query) async {
    return await _api.getWeatherInfo(query);
  }
}
