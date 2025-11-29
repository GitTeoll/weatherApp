import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/main_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => MainScreen())],
);
