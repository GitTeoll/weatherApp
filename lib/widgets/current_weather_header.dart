import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/weather_to_icon.dart';
import 'package:weather_app/common/weather_to_string.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';

class CurrentWeatherHeader extends ConsumerStatefulWidget {
  final Weather weather;
  const CurrentWeatherHeader({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentWeatherHeaderState();
}

class _CurrentWeatherHeaderState extends ConsumerState<CurrentWeatherHeader> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = ref.watch(WeatherProvider);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("김포시", style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                weatherToIcon(
                  widget.weather.currentWeather.weatherCode.toInt(),
                ),
                size: 70,
                color: Colors.white,
              ), //현재 날씨에 따른 날씨 아이콘 <<상태변화 필요>>
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${widget.weather.currentWeather.temp}°',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          weatherToString(
                            widget.weather.currentWeather.weatherCode.toInt(),
                          ),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    RefreshRow(weatherProvider: weatherProvider, ref: ref),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RefreshRow extends StatelessWidget {
  const RefreshRow({
    super.key,
    required this.weatherProvider,
    required this.ref,
  });

  final AsyncValue<Weather> weatherProvider;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        weatherProvider.when(
          data: (weather) {
            return Text(
              SplitString(weather.currentWeather.time),
              style: TextStyle(color: Colors.white),
            );
          },
          error: (e, st) {
            return Text("errorcode $e", style: TextStyle(color: Colors.white));
          },
          loading: () {
            return CircularProgressIndicator();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            ref.invalidate(WeatherProvider);
          },
          child: Icon(Icons.refresh_rounded, color: Colors.black),
        ),
      ],
    );
  }
}

String SplitString(String data) {
  final String year = data.substring(0, 4);
  final String month = data.substring(5, 7);
  final String date = data.substring(8, 10);
  final String hour = data.substring(11, 13);
  final String minute = data.substring(14);

  final String result = "업데이트 $month.$date $hour:$minute";
  return result;
}
