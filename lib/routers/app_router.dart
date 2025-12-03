import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/city_list_screen.dart';
import 'package:weather_app/screens/city_search_screen.dart';
import 'package:weather_app/screens/main_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => MainScreen()),
    GoRoute(path: '/city-list', builder: (context, state) => CityListScreen()),
    GoRoute(path: '/search', builder: (context, state) => CitySearchScreen()),
  ],
);
