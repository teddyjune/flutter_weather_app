import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/data_source/open_weather_api.dart';
import 'package:weather_app/data/data_source/weather_dto.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

import '../data_source/open_weather_api_impl_test.dart';
import 'weather_repository_test.mocks.dart';

@GenerateMocks([OpenWeatherApi]) //Mokito 사용할 때 사용
void main() {
  test('날씨 정보 받아오기', () async {
    final api = MockOpenWeatherApi(); //빈 값이어서 정의해줘야 한다.
    when(api.getWeatherInfo('seoul'))
        .thenAnswer((_) async => WeatherDto.fromJson(jsonDecode(fakeData)));
    final repository = WeatherRepository(api);
    final weather = await repository.getWeatherInfo('seoul');
    expect(weather.cityName, 'Seoul');
    expect(weather.icon, 'http://openweathermap.org/img/w/04d');
  });
}
