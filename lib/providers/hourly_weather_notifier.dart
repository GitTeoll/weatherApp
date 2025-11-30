import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/hourly_weather.dart';
import 'package:flutter/material.dart';

class HourlyWeatherNotifier extends Notifier<List<HourlyWeather>> {
  @override
  List<HourlyWeather> build() {
    return [
      HourlyWeather(time: "1 AM", temp: 20, icon: Icons.cloud),
      HourlyWeather(time: "2 AM", temp: 19, icon: Icons.cloud),
      HourlyWeather(time: "3 AM", temp: 18, icon: Icons.cloud),
      HourlyWeather(time: "4 AM", temp: 18, icon: Icons.cloud),
      HourlyWeather(time: "5 AM", temp: 17, icon: Icons.cloud),
      HourlyWeather(time: "6 AM", temp: 17, icon: Icons.wb_sunny),
      HourlyWeather(time: "7 AM", temp: 18, icon: Icons.wb_sunny),
      HourlyWeather(time: "8 AM", temp: 20, icon: Icons.wb_sunny),
      HourlyWeather(time: "9 AM", temp: 22, icon: Icons.wb_sunny),
      HourlyWeather(time: "10 AM", temp: 24, icon: Icons.wb_sunny),
      HourlyWeather(time: "11 AM", temp: 25, icon: Icons.wb_sunny),
      HourlyWeather(time: "12 PM", temp: 26, icon: Icons.wb_sunny),
    ];
  }
}
