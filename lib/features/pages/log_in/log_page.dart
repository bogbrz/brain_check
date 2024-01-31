import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LogInPage extends StatefulWidget {
  const LogInPage({
    super.key,
  });

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogInPageCubit>(),
      child: BlocBuilder<LogInPageCubit, LogInPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 27, 58, 93),
                title: Text(
                  "Welcome to:",
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "BRAINCHECK",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: const Text("Email"),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (isCreatingAccount) {
                        context
                            .read<LogInPageCubit>()
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                      } else {
                        context
                            .read<LogInPageCubit>()
                            .signInWitEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: isCreatingAccount ? 200 : 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          isCreatingAccount ? "Create Account " : "Log in",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  if (isCreatingAccount == false) ...[
                    TextButton(
                        onPressed: () {
                          passwordController.clear();
                          emailController.clear();
                          setState(() {
                            isCreatingAccount = true;
                          });
                        },
                        child: const Text(
                          "Doesn't have an Account?",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        )),
                  ],
                  if (isCreatingAccount == true) ...[
                    TextButton(
                        onPressed: () {
                          passwordController.clear();
                          emailController.clear();
                          setState(() {
                            isCreatingAccount = false;
                          });
                        },
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ))
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
