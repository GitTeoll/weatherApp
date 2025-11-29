import 'package:go_router/go_router.dart';
import '../pages/counerpage.dart';
import '../pages/page2.dart';
import '../pages/riverpod_test.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Counterpage()),
    GoRoute(path: '/page2', builder: (context, state) => Page2()),
    GoRoute(path: '/riverpodTest', builder: (context, state) => RiverpodTest()),
  ],
);
