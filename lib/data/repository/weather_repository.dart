import 'package:weather_app/data/model/weather.dart';

import '../data_source/open_weather_api.dart';

class WeatherRepository {
  //추상 타입이 되면서 독립적이게 된다.
  final OpenWeatherApi _api;

  WeatherRepository(this._api);

  Future<Weather> getWeatherInfo(String query) async {
    //데이터 가공은 model 클래스가 아니라 repository 부분에서 만든다.
    final weatherDto = await _api.getWeatherInfo(query);
    final icon =
        'http://openweathermap.org/img/w/${weatherDto.weather?.elementAt(0).icon}';
    return Weather(
      weather: weatherDto.weather?.elementAt(0).main ?? '',
      cityName: weatherDto.name ?? '',
      icon: icon,
      temp: weatherDto.main?.temp ?? 0,
    );
  }
}
