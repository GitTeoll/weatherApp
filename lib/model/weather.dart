import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/hourly_weather.dart';

class Weather {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyWeather;

  Weather({required this.currentWeather, required this.hourlyWeather});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      currentWeather: CurrentWeather.fromJson(json['current']),
      hourlyWeather: HourlyWeather.fromJson(json['hourly']),
    );
  }
}
