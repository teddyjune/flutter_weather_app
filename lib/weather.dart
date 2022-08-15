class Weather {
  final String weather;
  final String cityName;
  final num temp;
  final String icon;

  Weather(
      {required this.weather,
      required this.cityName,
      required this.temp,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: json['weather']['main'] as String,
      cityName: json['name'] as String,
      temp: json['main']['temp'] as num,
      icon: json['weather']['icon'] as String,
    );
  }
}
