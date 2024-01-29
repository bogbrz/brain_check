import 'package:brain_check/app/global%20cubit/cubit/global_user_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/root_page/root_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GlobalUserCubit>()..getProfile(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              background: Color.fromARGB(255, 31, 81, 135),
              seedColor: Color.fromARGB(255, 255, 255, 255),
            ),
            useMaterial3: true,
          ),
          home: RootPage()),
    );
  }
}
