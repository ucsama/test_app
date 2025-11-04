
import 'package:go_router/go_router.dart';
import '../screens/Screen_a.dart';
import '../screens/Screen_b.dart';
import '../screens/Screen_c.dart';

/// Defines the routes for the application.
class AppRouter {
  static const String screenA = '/';
  static const String screenB = '/b';
  static const String screenC = '/c';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: screenA,
        builder: (context, state) => const ScreenA(),
      ),
      GoRoute(
        path: screenB,
        builder: (context, state) {
          final Map<String, String>? extra = state.extra as Map<String, String>?;
          return ScreenB(
            phrase: extra?['phrase'],
            hashtags: extra?['hashtags'],
          );
        },
      ),
      GoRoute(
        path: screenC,
        builder: (context, state) => const ScreenC(),
      ),
    ],
  );
}
