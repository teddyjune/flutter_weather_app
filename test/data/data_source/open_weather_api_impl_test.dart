import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:weather_app/data/data_source/open_weather_api_impl.dart';
import 'package:weather_app/data/data_source/weather_dto.dart';

void main() {
  test('날씨 정보를 제대로 가져오는지 체크', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() ==
          'https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=95114a1e948559e010396b4debdf1672') {
        return Response(fakeData, 200);
      }
      return Response('error', 404);
    });
    final api = OpenWeatherApiImpl(client: mockClient);
    WeatherDto weather = await api.getWeatherInfo('seoul');
    expect(weather.name, 'Seoul');
    expect(weather.weather![0].main, 'Clouds');
  });
}

const fakeData = """
{
  "coord": {
    "lon": 126.9778,
    "lat": 37.5683
  },
  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 299.36,
    "feels_like": 299.36,
    "temp_min": 298.81,
    "temp_max": 299.91,
    "pressure": 1007,
    "humidity": 59
  },
  "visibility": 10000,
  "wind": {
    "speed": 2.57,
    "deg": 190
  },
  "clouds": {
    "all": 75
  },
  "dt": 1661334441,
  "sys": {
    "type": 1,
    "id": 8105,
    "country": "KR",
    "sunrise": 1661288118,
    "sunset": 1661336058
  },
  "timezone": 32400,
  "id": 1835848,
  "name": "Seoul",
  "cod": 200
}
""";
