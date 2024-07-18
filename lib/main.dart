import 'package:ecosense/src/screens/home/dashboard_screen.dart';
import 'package:ecosense/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(theme: AppTheme.theme, home: DashboardScreen()));
}
