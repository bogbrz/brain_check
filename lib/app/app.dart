import 'package:brain_check/app/core/config.dart';

import 'package:brain_check/features/pages/root_page/root_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: const RootPage());
  }
}
