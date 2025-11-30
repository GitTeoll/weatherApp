import 'package:dio/dio.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/hourly_weather.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApiService {
  //위도와 경도를 나중에 객체 생성시 받아옵니다.
  final double latitude;
  final double longitude;
  final Dio _dio = Dio();

  WeatherApiService({required this.latitude, required this.longitude});

  Future<Weather> fetchWeather() async {
    final url =
        'https://api.open-meteo.com/v1/forecast'
        '?latitude=$latitude'
        '&longitude=$longitude'
        '&daily=weather_code,temperature_2m_max,temperature_2m_min'
        '&hourly=temperature_2m,weather_code'
        '&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m'
        'timezone=auto&wind_speed_unit=ms';
    //위 url으로부터 response를 받아옵니다.
    final response = await _dio.get(url);

    //이 클래스는 현재 날씨정보만을 필요로 하므로 json에서 current 부분만 파싱합니다.
    final currentJson = response.data['current'];
    final hourlyJson = response.data['hourly'];

    //이후 파싱한 부분을 CurrentWeather 모델로 변환하여 반환합니다.
    return Weather(
      currentWeather: CurrentWeather.fromJson(currentJson),
      hourlyWeather: HourlyWeather.fromJson(hourlyJson),
    );
  }
}
