import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/hourly_weather_notifier.dart';
import '../model/hourly_weather.dart';

final hourlyWeatherNotifire =
    NotifierProvider<HourlyWeatherNotifier, List<HourlyWeather>>(
      HourlyWeatherNotifier.new,
    );
