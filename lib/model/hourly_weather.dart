import 'package:flutter/material.dart';

//메인 스크린에서 horizontal scroll view로 보여줄 시간별 날씨 정보 모델

class HourlyWeather {
  final String time;
  final int temp;
  final IconData icon;

  HourlyWeather({required this.time, required this.temp, required this.icon});
}
