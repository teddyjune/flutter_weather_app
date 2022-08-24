import 'package:weather_app/data/data_source/weather_dto.dart';

abstract class OpenWeatherApi {
  Future<WeatherDto> getWeatherInfo(String query);
}
//mock 객체로 만들기도 좋고 쉽게 바꿀 수도 있다.
