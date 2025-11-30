//메인 스크린에서 horizontal scroll view로 보여줄 시간별 날씨 정보 모델

class HourlyWeather {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> temp;

  HourlyWeather({
    required this.time,
    required this.weatherCode,
    required this.temp,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: List<String>.from(
        (json['time'] as List).map((e) => (e as String).toString()),
      ),
      weatherCode: List<int>.from(
        (json['weather_code'] as List).map((e) => (e as num).toInt()),
      ),
      temp: List<double>.from(
        (json['temperature_2m'] as List).map((e) => (e as num).toDouble()),
      ),
    );
  }
}
