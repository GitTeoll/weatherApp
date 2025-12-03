import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/weather_to_icon.dart';
import 'package:weather_app/model/weather.dart';

class WeeklyForecast extends ConsumerStatefulWidget {
  final Weather weather;
  const WeeklyForecast({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends ConsumerState<WeeklyForecast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08), // 아주 옅은 하얀 투명도
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.12), // 약간의 테두리
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      width: double.infinity,

      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
        child: ListView.builder(
          //스크롤 X 대신 컨테이너에 height 맞게 설정
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.weather.dailyWeather.time.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        index == 0
                            ? '오늘'
                            : "${DateFormat.E('ko-KR').format(DateTime.parse(widget.weather.dailyWeather.time[index]))}     ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withValues(alpha: .8),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        weatherToIcon(
                          widget.weather.dailyWeather.weatherCode[index]
                              .toInt(),
                        ),
                        color: Colors.white.withValues(alpha: .8),
                        size: 25,
                      ),
                      Text(
                        '${widget.weather.dailyWeather.tempMax[index]}° / ${widget.weather.dailyWeather.tempMin[index]}°',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
