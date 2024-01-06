import 'package:brain_check/app.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
