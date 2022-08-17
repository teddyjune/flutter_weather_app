class Weather {
  final String weather;
  final String cityName;
  final String icon;
  final double temp;

  Weather(this.weather, this.cityName, this.icon, this.temp);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      json['weather'][0]['main'] as String,
      json['name'] as String,
      json['weather']['icon'] as String,
      json['main']['temp'] as double,
    );
  }
}
