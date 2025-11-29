import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// branch - feature/weather-app

void main() {
  runApp(ProviderScope(child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
