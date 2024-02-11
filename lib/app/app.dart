import 'package:brain_check/app/core/config.dart';
import 'package:brain_check/app/cubit%20copy/token_cubit_cubit.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/root_page/root_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TokenCubitCubit>(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: Config.debugShowCheckModeBanner,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              background: const Color.fromARGB(255, 31, 81, 135),
              seedColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            useMaterial3: true,
          ),
          home: RootPage()),
    );
  }
}
