import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/log_in/log_page.dart';
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart';
import 'package:brain_check/navigator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<RootPageCubit>()..authStateChanges(),
        child: BlocBuilder<RootPageCubit, RootPageState>(
            builder: (context, state) {
          if (state.user == null) {
            return const LogInPage();
          }
          return const NavigatorPage();
        }));
  }
}
