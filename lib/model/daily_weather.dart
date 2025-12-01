class DailyWeather {
  //모두 리스트
  final List<String> time;
  final List<int> weatherCode;
  final List<double> tempMax;
  final List<double> tempMin;

  DailyWeather({
    required this.time,
    required this.weatherCode,
    required this.tempMax,
    required this.tempMin,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      time: (json['time'] as List)
          .map((e) => (e as String).toString())
          .toList(),
      weatherCode: (json['weather_code'] as List)
          .map((e) => (e as num).toInt())
          .toList(),
      tempMax: (json['temperature_2m_max'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      tempMin: (json['temperature_2m_min'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}
