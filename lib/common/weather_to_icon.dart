import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

IconData weatherToIcon(int code) {
  // ================================
  // 00–19 : 무강수 & 상태 변화
  // ================================

  if (code == 0) return WeatherIcons.day_sunny; // 맑음
  if (code == 1) return WeatherIcons.day_sunny_overcast; // 구름 소멸
  if (code == 2) return WeatherIcons.day_cloudy; // 변화 없음
  if (code == 3) return WeatherIcons.cloudy; // 구름 발달

  if (code == 4) return WeatherIcons.smoke; // 연기
  if (code == 5) return WeatherIcons.day_haze; // 연무(Haze)
  if (code == 6) return WeatherIcons.dust; // 공중에 먼지
  if (code == 7) return WeatherIcons.dust; // 바람이 먼지/모래 일으킴
  if (code == 8) return WeatherIcons.sandstorm; // 잘 발달된 모래/먼지 소용돌이
  if (code == 9) return WeatherIcons.sandstorm; // 모래폭풍

  if (code == 10) return WeatherIcons.fog; // Mist
  if (code == 11) return WeatherIcons.fog; // shallow fog
  if (code == 12) return WeatherIcons.fog; // continuous shallow fog

  if (code == 13) return WeatherIcons.lightning; // 번개 보임
  if (code == 14) return WeatherIcons.rain_mix; // 강수 보이나 지면 X
  if (code == 15) return WeatherIcons.rain_mix; // 강수 보임, 먼 거리
  if (code == 16) return WeatherIcons.rain_mix; // 강수 near
  if (code == 17) return WeatherIcons.lightning; // 천둥 번개(강수 없음)
  if (code == 18) return WeatherIcons.strong_wind; // 스콜(squall)
  if (code == 19)
    return WeatherIcons.tornado; // funnel cloud (tornado/waterspout)

  // ================================
  // 20–29 : 지난 1시간 내 강수/안개 있었으나 현재 없음
  // ================================
  if (code == 20) return WeatherIcons.sprinkle; // 이슬비/눈
  if (code == 21) return WeatherIcons.rain; // 비
  if (code == 22) return WeatherIcons.snow; // 눈
  if (code == 23) return WeatherIcons.rain_mix; // 비 + 눈
  if (code == 24) return WeatherIcons.rain_mix; // freezing rain/drizzle
  if (code == 25) return WeatherIcons.showers; // 소나기 비
  if (code == 26) return WeatherIcons.snow_wind; // 소나기 눈/비+눈
  if (code == 27) return WeatherIcons.hail; // 소나기 우박/작은 얼음
  if (code == 28) return WeatherIcons.fog; // 안개
  if (code == 29) return WeatherIcons.thunderstorm; // 천둥번개

  // ================================
  // 30–39 : 모래폭풍/눈날림
  // ================================
  if (code == 30) return WeatherIcons.sandstorm; // 약한 모래폭풍 감소
  if (code == 31) return WeatherIcons.sandstorm; // 변화 없음
  if (code == 32) return WeatherIcons.sandstorm; // 증가

  if (code == 33) return WeatherIcons.sandstorm; // 강한 모래폭풍 감소
  if (code == 34) return WeatherIcons.sandstorm;
  if (code == 35) return WeatherIcons.sandstorm;

  if (code == 36) return WeatherIcons.snow_wind; // 낮은 높이 눈날림
  if (code == 37) return WeatherIcons.snow_wind; // 강한 눈날림
  if (code == 38) return WeatherIcons.snow_wind; // 높은 높이 눈날림
  if (code == 39) return WeatherIcons.snow_wind;

  // ================================
  // 40–49 : Fog/ice fog
  // ================================
  if (code == 40) return WeatherIcons.fog;
  if (code == 41) return WeatherIcons.fog;
  if (code == 42) return WeatherIcons.fog;
  if (code == 43) return WeatherIcons.fog;
  if (code == 44) return WeatherIcons.fog;
  if (code == 45) return WeatherIcons.fog;
  if (code == 46) return WeatherIcons.fog;
  if (code == 47) return WeatherIcons.fog;
  if (code == 48) return WeatherIcons.fog; // 서리 안개
  if (code == 49) return WeatherIcons.fog;

  // ================================
  // 50–59 : Drizzle
  // ================================
  if (code >= 50 && code <= 55) return WeatherIcons.sprinkle;
  if (code == 56 || code == 57) return WeatherIcons.rain_mix;
  if (code == 58 || code == 59) return WeatherIcons.rain;

  // ================================
  // 60–69 : Rain
  // ================================
  if (code >= 60 && code <= 65) return WeatherIcons.rain;
  if (code == 66 || code == 67) return WeatherIcons.rain_mix; // freezing rain
  if (code == 68 || code == 69) return WeatherIcons.rain_mix; // 비 + 눈

  // ================================
  // 70–79 : 고체 강수(비 shower 아님)
  // ================================
  if (code >= 70 && code <= 75) return WeatherIcons.snow;
  if (code == 76) return WeatherIcons.snowflake_cold; // diamond dust
  if (code == 77) return WeatherIcons.snowflake_cold; // snow grains
  if (code == 78) return WeatherIcons.snowflake_cold; // star-like snow crystals
  if (code == 79) return WeatherIcons.hail; // ice pellets

  // ================================
  // 80–99 : 소나기 또는 천둥폭풍
  // ================================
  if (code >= 80 && code <= 82) return WeatherIcons.showers; // 소나기 비
  if (code == 83 || code == 84) return WeatherIcons.rain_mix; // 소나기 비+눈
  if (code == 85 || code == 86) return WeatherIcons.snow_wind; // 소나기 눈
  if (code == 87 || code == 88) return WeatherIcons.hail; // 소나기 작은 우박/눈알
  if (code == 89 || code == 90) return WeatherIcons.hail; // 소나기 우박

  if (code == 91 || code == 92) return WeatherIcons.thunderstorm; // 천둥 + 비
  if (code == 93 || code == 94) return WeatherIcons.thunderstorm; // 천둥 + 눈/비+눈
  if (code == 95) return WeatherIcons.thunderstorm; // 천둥 + 약~보통 비
  if (code == 96 || code == 97) return WeatherIcons.storm_showers; // 천둥 + 우박
  if (code == 98 || code == 99)
    return WeatherIcons.storm_showers; // 천둥 + 모래폭풍 + 우박 등

  // 알 수 없는 경우
  return WeatherIcons.na;
}
