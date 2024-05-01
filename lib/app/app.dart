import 'package:brain_check/app/app_routes.dart';
import 'package:brain_check/app/core/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: Config.debugShowCheckModeBanner,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(
            background: const Color.fromARGB(255, 31, 81, 135),
            seedColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router);
  }
}
