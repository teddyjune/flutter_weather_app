import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:weather_app/data/data_source/open_weather_api_impl.dart';

void main() {
  test('날씨 정보를 제대로 가져오는지 체크', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() ==
          'https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=95114a1e948559e010396b4debdf1672') {
        return Response(fakeData, 200);
      }
      return Response('error', 404);
    });
    final api = OpenWeatherApiImpl(api);
  });
}