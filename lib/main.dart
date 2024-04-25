import 'package:brain_check/app/app.dart';
import 'package:brain_check/app/app_routes.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  
  runApp(const MyApp());
}
