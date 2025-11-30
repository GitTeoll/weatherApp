import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/sevices/weather_api_service.dart';

final weatherApiServiceProvider = Provider<WeatherApiService>((ref) {
  //여기서는 예시로 서울의 위도와 경도를 사용합니다.
  return WeatherApiService(latitude: 37.5665, longitude: 126.9780);
});

final WeatherProvider = FutureProvider<Weather>((ref) async {
  final weatherApiService = ref.watch(weatherApiServiceProvider);
  return weatherApiService.fetchWeather();
});
