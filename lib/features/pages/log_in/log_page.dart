import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
                backgroundColor: const Color.fromARGB(255, 27, 58, 93),
                title: Text(
                  "Welcome to:",
                  style: GoogleFonts.bungee(fontSize: 35),
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
                            style: GoogleFonts.bungee(fontSize: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextField(
                    style: GoogleFonts.bungee(fontSize: 20),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 8)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 8)),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.bungee(color: Colors.black),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: GoogleFonts.bungee(fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.bungee(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 8)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 8)),
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
                      width: isCreatingAccount ? 250 : 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 8,
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          isCreatingAccount ? "Create Account " : "Log in",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bungee(fontSize: 35),
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
                        child: Text(
                          "Doesn't have an Account?",
                          style: GoogleFonts.bungee(
                              fontSize: 15, color: Colors.black),
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
                        child: Text(
                          "Already have an account?",
                          style: GoogleFonts.bungee(
                              fontSize: 15, color: Colors.black),
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
