import 'package:educate/config/di/di.dart';
import 'package:flutter/material.dart';
import 'learnify_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const EducateApp());
}
