import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String weather,
    required String cityName,
    required String icon,
    required num temp,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}

// class Weather {
//   final String weather;
//   final String cityName;
//   final String icon;
//   final num temp;
//
//   Weather(
//       {required this.weather,
//       required this.cityName,
//       required this.icon,
//       required this.temp});
//
//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       weather: json['weather'][0]['main'] as String,
//       cityName: json['name'] as String,
//       icon: json['weather'][0]['icon'] as String,
//       temp: json['main']['temp'] as num,
//     );
//   }
// }
