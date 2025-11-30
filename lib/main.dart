import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/routers/app_router.dart';

void main() {
  runApp(ProviderScope(child: WeatherApp()));
  print(DateTime.now().hour);
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter);
  }
}
