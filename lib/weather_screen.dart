import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_view_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('날씨 알리미'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2),
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    viewModel.fetchWeatherInfo(_controller.text);
                  },
                  child: const Icon(Icons.search)),
              hintText: '도시이름을 입력하세요',
            ),
          ),
        ),
        Column(
          children: [
            Text(viewModel.myWeather.cityName,
                style: const TextStyle(fontSize: 50)),
            Image.network(
              viewModel.myWeather.icon,
            ),
            Text(
              viewModel.myWeather.weather,
              style: const TextStyle(fontSize: 30),
            ),
            Text('${viewModel.convertTemp(viewModel.myWeather.temp)}°',
                style: const TextStyle(fontSize: 30)),
          ],
        )
      ]),
    );
  }
}
