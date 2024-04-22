import 'package:brain_check/features/pages/home_page/home_page.dart';
import 'package:brain_check/features/pages/log_in/log_page.dart';
import 'package:brain_check/features/pages/root_page/root_page.dart';
import 'package:brain_check/features/pages/set_up_user_page/set_up_user.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/rootPage",
    routes: <RouteBase>[
      GoRoute(
        path: "/rootPage",
        name: "/rootPage",
        builder: (context, state) {
          return RootPage();
        },
      ),
      GoRoute(
        path: "/loginPage",
        name: "/loginPage",
        builder: (context, state) {
          return LogInPage();
        },
      ),
      GoRoute(
        path: "/setUpUserPage",
        name: "/setUpUserPage",
        builder: (context, state) {
          return SetUpUserPage();
        },
      ),
    ],
  );
}
