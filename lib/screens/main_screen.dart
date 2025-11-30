import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/widgets/current_weather_header.dart';
import 'package:weather_app/widgets/weather_information.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5CA1DF),
      body: SafeArea(
        //SafeArea 설정을 통해 노치부분이나 상태바 부분을 피해서 화면이 그려지도록 함
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            30,
            10.0,
            30,
            0.0,
          ), //메인스크인 전체의 좌우패딩 30 설정
          child: Column(
            children: [
              CurrentWeatherHeader(),
              SizedBox(height: 30),
              WeatherInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
