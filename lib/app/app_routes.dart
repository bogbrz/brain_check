import 'dart:async';

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
import 'package:brain_check/features/pages/ranking_page/ranking_page.dart';
import 'package:brain_check/features/pages/result_page/result_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/rooms_list_page.dart';

import 'package:brain_check/features/pages/set_up_user_page/set_up_user.dart';
import 'package:brain_check/features/pages/user_page/user_page.dart';
import 'package:brain_check/navigator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final User? user = FirebaseAuth.instance.currentUser;

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionBNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionCNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
StatefulNavigationShell? globalNavigationShell;

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
    redirectLimit: 3,
    redirect: (context, state) {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return "/loginPage";
      }
      if (user.displayName == null && state.matchedLocation == "/loginPage") {
        return "/setUpUserPage";
      }
      if (user.displayName != null && state.matchedLocation == "/loginPage") {
        return "/homePage";
      }
      if (user.displayName != null &&
          state.matchedLocation == "/setUpUserPage") {
        return "/homePage";
      }

      return null;
    },
    initialLocation: "/loginPage",
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // Return the widget that implements the custom shell (in this case
          // using a BottomNavigationBar). The StatefulNavigationShell is passed
          // to be able access the state of the shell and to navigate to other
          // branches in a stateful way.
          return NavigatorPage(
            user: user,
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // The route branch for the first tab of the bottom navigation bar.
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  // The screen to display as the root in the first tab of the
                  // bottom navigation bar.
                  path: '/homePage',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final User? userr = FirebaseAuth.instance.currentUser;
                    return CustomTransitionPage(
                        transitionDuration: Duration(seconds: 5),
                        key: state.pageKey,
                        child: HomePage(
                          user: userr,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: Offset(-1, 0), end: Offset.zero)
                                .animate(animation),
                            child: child,
                          );
                        });
                  }),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _sectionCNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.
                path: '/rankingPage',
                builder: (BuildContext context, GoRouterState state) =>
                    RankingPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionBNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  // The screen to display as the root in the first tab of the
                  // bottom navigation bar.
                  path: '/userPage',
                  builder: (BuildContext context, GoRouterState state) {
                    final User? userr = FirebaseAuth.instance.currentUser;
                    return UserPage(
                      user: userr,
                    );
                  }),
            ],
          ),
        ],
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
      // GoRoute(
      //   path: "/navigatorPage",
      //   name: "/navigatorPage",
      //   pageBuilder: (
      //     context,
      //     state,
      //   ) {
      //     final User? userr = FirebaseAuth.instance.currentUser;
      //     //      final StatefulNavigationShell navigationShell =
      //     // StatefulNavigationShell;
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       child: NavigatorPage(
      //         user: userr,
      //         // navigationShell: globalNavigationShell,
      //       ),
      //       transitionDuration: Duration(seconds: 2),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) {
      //         return FadeTransition(
      //           opacity:
      //               CurveTween(curve: Curves.easeInCirc).animate(animation),
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
      GoRoute(
        path: "/userPage",
        name: "/userPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          return CustomTransitionPage(
            transitionDuration: Duration(seconds: 5),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
            child: UserPage(
              user: user,
            ),
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
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            child: GameTypePage(
              user: user,
              profile: profile,
            ),
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: "/categoryPage",
        name: "/categoryPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
            child: CategoryPage(
              user: user,
              profileModel: profile,
            ),
          );
        },
      ),
      GoRoute(
        path: "/rankedGamePage",
        name: "/rankedGamePage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
            child: RankedGamePage(
              user: user,
              profileModel: profile,
            ),
          );
        },
      ),
      GoRoute(
        path: "/roomsListPage",
        name: "/roomsListPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
            child: RoomsListPage(
              user: user,
              profile: profile,
            ),
          );
        },
      ),
      GoRoute(
        path: "/difficultyPage",
        name: "/difficultyPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final DifficultyRouteModel model =
              state.extra as DifficultyRouteModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInCubic).animate(animation),
                child: child,
              );
            },
            child: DifficultyPage(
              model: model,
            ),
          );
        },
      ),
      GoRoute(
        path: "/questionPage",
        name: "/questionPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final QuestionPageRouteModel model =
              state.extra as QuestionPageRouteModel;

          return CustomTransitionPage(
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
            child: QuestionPage(
              model: model,
            ),
          );
        },
      ),
      GoRoute(
        path: "/resultPage",
        name: "/resultPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final ResultPageRouteModel model =
              state.extra as ResultPageRouteModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1.5.toInt()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
            child: ResultPage(
              model: model,
            ),
          );
        },
      ),
      GoRoute(
        path: "/duelRoomPage",
        name: "/duelRoomPage",
        pageBuilder: (context, state) {
          // final User? user = state.extra as User?;
          final DuelRoomRoutePageModel model =
              state.extra as DuelRoomRoutePageModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
            child: DuelRoomPage(
              model: model,
            ),
          );
        },
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
