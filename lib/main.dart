import 'package:ecosense/src/blocs/heatmap/heatmap_bloc.dart';
import 'package:ecosense/src/blocs/home/bloc.dart';
import 'package:ecosense/src/screens/home/dashboard_screen.dart';
import 'package:ecosense/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
    BlocProvider<HeatMapBloc>(
      create: (context) => HeatMapBloc(),
    )
  ], child: MaterialApp(theme: AppTheme.theme, home: const DashboardScreen())));
}
