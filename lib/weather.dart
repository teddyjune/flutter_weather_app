class Weather {
  List weather;
  final Map<String, dynamic> main;
  final String description;
  final String icon;

  Weather({
    required this.weather,
    required this.main,
    required this.description,
    required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: json['weather'] as List,
      main: json['main'] as Map<String, dynamic>,
      description: json['description'],
      icon: json['icon'],
    );
  }
}

