import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:weather_app/data/data_source/open_weather_api_impl.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

import '../data_source/open_weather_api_impl_test.dart';

void main() {
  test('날씨 정보 받아오기', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() ==
          'https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=95114a1e948559e010396b4debdf1672') {
        return Response(fakeData, 200);
      }
      return Response('error', 404);
    });
    final api = OpenWeatherApiImpl(client: mockClient);
    final repository = WeatherRepository(api);
    final weather = await repository.getWeatherInfo('seoul');
    expect(weather.cityName, 'Seoul');
    expect(weather.icon, 'http://openweathermap.org/img/w/04d');
  });
}
