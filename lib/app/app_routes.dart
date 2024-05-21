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
import 'package:brain_check/features/pages/navigator_page/navigator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
         
          return NavigatorPage(
            user: user,
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
        
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
              
                  path: '/homePage',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final User? userr = FirebaseAuth.instance.currentUser;
                    return CustomTransitionPage(
                        transitionDuration: const Duration(seconds: 5),
                        key: state.pageKey,
                        child: HomePage(
                          user: userr,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(-1, 0), end: Offset.zero)
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
          return const LogInPage();
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
        path: "/userPage",
        name: "/userPage",
        pageBuilder: (context, state) {
     
          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 5),
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
        
          return HomePage(
            user: user,
          );
        },
      ),
      GoRoute(
        path: "/gameTypePage",
        name: "/gameTypePage",
        pageBuilder: (context, state) {
          
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            child: GameTypePage(
              user: user,
              profile: profile,
            ),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
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
          
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
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
          
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
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
          
          final ProfileModel profile = state.extra as ProfileModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
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
          
          final DifficultyRouteModel model =
              state.extra as DifficultyRouteModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(seconds: 1),
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
          
          final QuestionPageRouteModel model =
              state.extra as QuestionPageRouteModel;

          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 2),
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
          
          final DuelRoomRoutePageModel model =
              state.extra as DuelRoomRoutePageModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(seconds: 1),
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
