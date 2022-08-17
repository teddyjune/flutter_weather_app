class Weather {
  final String weather;
  final String cityName;
  final String icon;
  final num temp;

  Weather(
      {required this.weather,
      required this.cityName,
      required this.icon,
      required this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: json['weather'][0]['main'] as String,
      cityName: json['name'] as String,
      icon: json['weather']['icon'] as String,
      temp: json['main']['temp'] as num,
    );
  }
}
