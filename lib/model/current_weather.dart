class CurrentWeather {
  final String time;
  final double temp;
  final double realFeel;
  final double weatherCode;
  final double windSpeed;
  final double relativeHumidity;

  CurrentWeather({
    required this.time,
    required this.temp,
    required this.realFeel,
    required this.weatherCode,
    required this.windSpeed,
    required this.relativeHumidity,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      temp: (json['temperature_2m'] as num).toDouble(),
      realFeel: (json['apparent_temperature'] as num).toDouble(),
      relativeHumidity: (json['relative_humidity_2m'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toDouble(),
      windSpeed: (json['wind_speed_10m'] as num).toDouble(),
    );
  }
}
