import 'package:ecosense/src/blocs/heatmap/heatmap_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeatmapScreen extends StatefulWidget {
  const HeatmapScreen({super.key});

  @override
  State<HeatmapScreen> createState() => _HeatmapScreenState();
}

class _HeatmapScreenState extends State<HeatmapScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HeatMapBloc>().add(GetHeatMapEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [],
      ),
    ));
  }
}
