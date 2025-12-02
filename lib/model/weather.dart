import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/daily_weather.dart';
import 'package:weather_app/model/hourly_weather.dart';

class Weather {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyWeather;
  final DailyWeather dailyWeather;

  Weather({
    required this.currentWeather,
    required this.hourlyWeather,
    required this.dailyWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      currentWeather: CurrentWeather.fromJson(json['current']),
      hourlyWeather: HourlyWeather.fromJson(json['hourly']),
      dailyWeather: DailyWeather.fromJson(json['daily']),
    );
  }
  CurrentWeather getCurrentWeather() {
    return currentWeather;
  }
}
