import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogInPageCubit>(),
      child: BlocBuilder<LogInPageCubit, LogInPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 27, 58, 93),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.read<LogInPageCubit>().signOut();
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: Center(
              child: Text("SECOND PAGE"),
            ),
          );
        },
      ),
    );
  }
}
