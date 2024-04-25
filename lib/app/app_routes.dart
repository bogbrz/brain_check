import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/difficulty_page_route_model.dart';
import 'package:brain_check/domain/models/duel_room_page_route_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/models/question_page_route_model.dart';
import 'package:brain_check/domain/models/result_page_route_model.dart';
import 'package:brain_check/features/pages/categories_page/categories_page.dart';
import 'package:brain_check/features/pages/difficulty_page/difficulty_page.dart';
import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:brain_check/features/pages/game_type_page.dart';
import 'package:brain_check/features/pages/home_page/home_page.dart';
import 'package:brain_check/features/pages/log_in/log_page.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:brain_check/features/pages/ranked_game_page/ranked_game_page.dart';
import 'package:brain_check/features/pages/result_page/result_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/rooms_list_page.dart';
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart';
import 'package:brain_check/features/pages/root_page/root_page.dart';
import 'package:brain_check/features/pages/set_up_user_page/set_up_user.dart';
import 'package:brain_check/features/pages/user_page/user_page.dart';
import 'package:brain_check/navigator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final User? user = FirebaseAuth.instance.currentUser;
Future<String?> appRouteRedirect(
    BuildContext context, GoRouterState state) async {
  final loggedIn = user != null &&
      user!.displayName != null &&
      state.matchedLocation == "/loginPage";
  final logg = user != null && state.matchedLocation == "/loginPage";
  final logginIn = user != null &&
      user!.displayName == null &&
      state.matchedLocation == "/loginPage";
  final signOut = user == null && state.matchedLocation == "/loginPage";
  if (loggedIn) return "/navigatorPage";
  if (logg) return "/navigatorPage";
  if (logginIn) return "/setUpUserPage";
  if (signOut) return "/loginPage";
  return null;
}

class AppRouter {
  static GoRouter router = GoRouter(
    // redirect: appRouteRedirect,
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
      GoRoute(
        path: "/navigatorPage",
        name: "/navigatorPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          return NavigatorPage(
            user: user,
          );
        },
      ),
      GoRoute(
        path: "/userPage",
        name: "/userPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          return UserPage(
            user: user,
          );
        },
      ),
      GoRoute(
        path: "/homePage",
        name: "/homePage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          return HomePage(
            user: user,
          );
        },
      ),
      GoRoute(
        path: "/gameTypePage",
        name: "/gameTypePage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return GameTypePage(
            user: user,
            profile: profile,
          );
        },
      ),
      GoRoute(
        path: "/categoryPage",
        name: "/categoryPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return CategoryPage(
            user: user,
            profileModel: profile,
          );
        },
      ),
      GoRoute(
        path: "/rankedGamePage",
        name: "/rankedGamePage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return RankedGamePage(
            user: user,
            profileModel: profile,
          );
        },
      ),
      GoRoute(
        path: "/roomsListPage",
        name: "/roomsListPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return RoomsListPage(
            user: user,
            profile: profile,
          );
        },
      ),
      GoRoute(
        path: "/difficultyPage",
        name: "/difficultyPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final DifficultyRouteModel model =
              state.extra as DifficultyRouteModel;

          return DifficultyPage(
            model: model,
          );
        },
      ),
      GoRoute(
        path: "/questionPage",
        name: "/questionPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final QuestionPageRouteModel model =
              state.extra as QuestionPageRouteModel;

          return QuestionPage(
            model: model,
          );
        },
      ),
      GoRoute(
        path: "/resultPage",
        name: "/resultPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final ResultPageRouteModel model =
              state.extra as ResultPageRouteModel;

          return ResultPage(
            model: model,
          );
        },
      ),
      GoRoute(
        path: "/duelRoomPage",
        name: "/duelRoomPage",
        builder: (context, state) {
          // final User? user = state.extra as User?;
          final DuelRoomRoutePageModel model =
              state.extra as DuelRoomRoutePageModel;

          return DuelRoomPage(
            model: model,
          );
        },
      ),
    ],
  );
}
