import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/providers/current_weather_provider.dart';
import 'package:weather_app/widgets/weather_refresh.dart';

class CurrentWeatherHeader extends ConsumerStatefulWidget {
  final CurrentWeather weather;
  const CurrentWeatherHeader({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentWeatherHeaderState();
}

class _CurrentWeatherHeaderState extends ConsumerState<CurrentWeatherHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.blueAccent,
      //   borderRadius: BorderRadius.circular(20),
      // ),
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
                Icons.cloud,
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
                          '${widget.weather.temp}°',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          "It's Cloudy Day",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CurrentDateTimeRow(
                          onRefresh: () {
                            log('Weather data refreshed');
                          },
                        ),
                      ],
                    ),
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
