import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/weather_to_description.dart';
import 'package:weather_app/common/weather_to_icon.dart';
import 'package:weather_app/model/weather.dart';

class WeatherInformation extends ConsumerStatefulWidget {
  final Weather weather;
  const WeatherInformation({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeatherInformationState();
}

class _WeatherInformationState extends ConsumerState<WeatherInformation> {
  @override
  Widget build(BuildContext context) {
    //hourlyWeatherNotifire 프로바이더를 사용하여 시간별 날씨 데이터를 가져옴<현재 더미데이터 사용중>

    return Container(
      decoration: BoxDecoration(
        //전체 컨테이너의 스타일 설정
        color: Colors.white.withValues(alpha: .8),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          12.0,
          16.0,
          12.0,
          16.0,
        ), //컨테이너 내부의 패딩 설정
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  weatherToDescription(
                    widget.weather.currentWeather.weatherCode.toInt(),
                  ), //날씨에 따라 동적으로 텍스트 변결 필요
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: .8),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                //리스트뷰의 스타일 설정
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  bottom: BorderSide(
                    //아래쫌 테두리 설정
                    color: Colors.white.withValues(alpha: .5),
                    width: 1,
                  ),
                ),
                color: Colors.blue.withValues(alpha: 0.1),
              ),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 72, //hourlyWeather의 리스트 개수를 3일로 설정(72시간)
                  itemBuilder: (context, index) {
                    //파싱하는 경우 당일00시부터 시작하므로 현재시간에 맞춰줌
                    index = index + DateTime.now().hour;
                    return Padding(
                      //리스트뷰 내 아이템 간의 패딩 설정
                      padding: EdgeInsets.only(right: 14.0),
                      child: Column(
                        children: [
                          Text(
                            setTime(widget.weather.hourlyWeather.time[index]),
                          ),
                          SizedBox(height: 8),
                          Icon(
                            weatherToIcon(
                              widget.weather.hourlyWeather.weatherCode[index],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("${widget.weather.hourlyWeather.temp[index]}°"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RealfeelHumidityWind(
                    label: "체감온도",
                    value: "${widget.weather.currentWeather.realFeel}°",
                  ),
                  VerticalDivider(thickness: 1, width: 2, color: Colors.black),
                  RealfeelHumidityWind(
                    label: "습도",
                    value: "${widget.weather.currentWeather.relativeHumidity}%",
                  ),
                  VerticalDivider(thickness: 1, width: 2, color: Colors.black),
                  RealfeelHumidityWind(
                    label: "바람",
                    value: "${widget.weather.currentWeather.windSpeed} m/s",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RealfeelHumidityWind extends StatelessWidget {
  final String label;
  final String value;

  const RealfeelHumidityWind({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(label), SizedBox(height: 4), Text(value)]);
  }
}

String setTime(String dateTime) {
  final timePart = dateTime.split("T")[1];
  final onlyTime = timePart.split(":")[0];
  return "$onlyTime시";
}
