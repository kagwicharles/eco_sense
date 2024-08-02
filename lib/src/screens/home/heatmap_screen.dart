import 'package:ecosense/src/blocs/heatmap/heatmap_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/loading_view.dart';

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
    return Scaffold(
        body: SafeArea(
            child: BlocListener<HeatMapBloc, HeatMapState>(
                listener: (context, state) {},
                child: BlocBuilder<HeatMapBloc, HeatMapState>(
                    builder: (context, state) {
                  if (state is HeatMapLoadingState) const LoadingView();
                  if (state is HeatMapLoadingState) {
                    return const LoadingView();
                  }
                  if (state is HeatMapLoadedState) {
                    return const Text("HeatMAP");
                  }
                  return const SizedBox();
                }))));
  }
}
