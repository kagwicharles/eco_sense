import 'package:dio/dio.dart';
import 'package:ecosense/src/blocs/heatmap/heatmap_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../views/loading_view.dart';

class HeatmapScreen extends StatefulWidget {
  const HeatmapScreen({super.key});

  @override
  State<HeatmapScreen> createState() => _HeatmapScreenState();
}

class _HeatmapScreenState extends State<HeatmapScreen> {
  GoogleMapController? _controller;
  TileOverlay? _tileOverlay;

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
                    _tileOverlay = TileOverlay(
                      tileOverlayId: const TileOverlayId('tile_overlay'),
                      tileProvider:
                          _CustomTileProvider(response: state.heatmap),
                    );
                    return SizedBox(
                        height: 256,
                        width: double.infinity,
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            _controller = controller;
                          },
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(37.7749, -122.4194),
                            zoom: 2,
                          ),
                          mapType: MapType.none,
                          // ignore: prefer_collection_literals
                          tileOverlays: Set.of([_tileOverlay!]),
                        ));
                  }
                  return const SizedBox();
                }))));
  }
}

class _CustomTileProvider implements TileProvider {
  final Response response;

  _CustomTileProvider({required this.response});

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    return Tile(
      256,
      256,
      response.data,
    );
  }
}
