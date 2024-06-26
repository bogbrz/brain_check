import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final passwordConfirmController = TextEditingController();
final nickNameController = TextEditingController();

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
      create: (context) => getIt<LogInPageCubit>()..authStateChanges(),
      child: BlocConsumer<LogInPageCubit, LogInPageState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 27, 48),
                      Color.fromARGB(180, 66, 120, 255),
                    ],
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        children: [
                          Text(
                            " ${AppLocalizations.of(context).welcomeTo} BRAINCHECK",
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                                color: Colors.white),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(180, 66, 120, 255),
                                ],
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Email",
                                fillColor: Colors.transparent,
                                filled: true,
                                hintStyle:
                                    GoogleFonts.bungee(color: Colors.black),
                              ),
                              controller: emailController,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(180, 66, 120, 255),
                                ],
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText:
                                    AppLocalizations.of(context).password,
                                fillColor: Colors.transparent,
                                filled: true,
                                hintStyle:
                                    GoogleFonts.bungee(color: Colors.black),
                              ),
                              controller: passwordController,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          isCreatingAccount
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(180, 66, 120, 255),
                                      ],
                                    ),
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "Confirm password",
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintStyle: GoogleFonts.bungee(
                                          color: Colors.black),
                                    ),
                                    controller: passwordConfirmController,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: isCreatingAccount == true &&
                                    passwordConfirmController.text.isEmpty
                                ? null
                                : () async {
                                    if (isCreatingAccount &&
                                        passwordConfirmController.text ==
                                            passwordController.text) {
                                      context
                                          .read<LogInPageCubit>()
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);

                                   
                                    } else if (isCreatingAccount &&
                                        passwordConfirmController.text !=
                                            passwordController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Passwords are not the same")));
                                    } else {
                                      context
                                          .read<LogInPageCubit>()
                                          .signInWitEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                    }
                                  },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(180, 245, 245, 245),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  isCreatingAccount
                                      ? AppLocalizations.of(context).createAccount
                                      : AppLocalizations.of(context).logIn,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              30),
                                ),
                              ),
                            ),
                          ),
                          if (isCreatingAccount == false) ...[
                            TextButton(
                                onPressed: () {
                                  passwordController.clear();
                                  passwordConfirmController.clear();
                                  emailController.clear();
                                  setState(() {
                                    isCreatingAccount = true;
                                  });
                                },
                                child: Text(
                                  AppLocalizations.of(context).doesntHave,
                                  style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black),
                                )),
                          ],
                          if (isCreatingAccount == true) ...[
                            TextButton(
                                onPressed: () {
                                  passwordController.clear();
                                  passwordConfirmController.clear();
                                  emailController.clear();
                                  setState(() {
                                    isCreatingAccount = false;
                                  });
                                },
                                child: Text(
                                  AppLocalizations.of(context).alreadyHave,
                                  style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      color: Colors.black),
                                ))
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
