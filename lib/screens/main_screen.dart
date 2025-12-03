import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/current_weather_header.dart';
import 'package:weather_app/widgets/weather_information.dart';
import 'package:weather_app/widgets/weekly_forecast.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(WeatherProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A2A66), Color(0xFF0D3D8F), Color(0xFF0F4F9F)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: weatherAsync.when(
          error: (error, _) => Center(
            child: Text(
              'Error: $error',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          loading: () =>
              Center(child: CircularProgressIndicator(color: Colors.white)),
          data: (weather) {
            return MainPage(weather: weather);
          },
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //SafeArea 설정을 통해 노치부분이나 상태바 부분을 피해서 화면이 그려지도록 함
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10.0, 30, 0.0), //메인스크인 전체의 좌우패딩 30 설정
        child: Stack(
          //Positioned 위젯을 사용하기 위해서는 상위 위젯으로 StacK 이 필요함
          children: [
            ListView(
              children: [
                CurrentWeatherHeader(weather: weather),
                SizedBox(height: 30),
                WeatherInformation(weather: weather),
                SizedBox(height: 30),
                WeeklyForecast(weather: weather),
                WeatherInformation(weather: weather),
                WeatherInformation(weather: weather),
                WeatherInformation(weather: weather),
                WeatherInformation(weather: weather),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF0F4F9F)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          GoRouter.of(context).push('/city-list');
                        },
                        icon: Icon(
                          Icons.manage_search_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          GoRouter.of(context).push('/search');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
