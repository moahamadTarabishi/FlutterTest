import 'package:flutter/material.dart';
import 'package:workiom_signup/app.dart';
import 'package:workiom_signup/core/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
