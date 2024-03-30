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
                  style: GoogleFonts.bungee(
                      fontSize: MediaQuery.of(context).size.height / 20,
                      color: Colors.white),
                )),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "BRAINCHECK",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: MediaQuery.of(context).size.width / 55,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: MediaQuery.of(context).size.width / 55,
                      )),
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
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.bungee(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: MediaQuery.of(context).size.width / 55,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: MediaQuery.of(context).size.width / 55,
                      )),
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
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: MediaQuery.of(context).size.width / 55,
                            color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          isCreatingAccount ? "Create Account " : "Log in",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bungee(
                              fontSize:
                                  MediaQuery.of(context).size.height / 30),
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
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: Colors.black),
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
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: Colors.black),
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
