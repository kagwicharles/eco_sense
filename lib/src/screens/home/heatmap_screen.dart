import 'package:dio/dio.dart';
import 'package:ecosense/src/blocs/heatmap/heatmap_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../views/loading_view.dart';

class HeatMapScreen extends StatelessWidget {
  GoogleMapController? _controller;
  TileOverlay? _tileOverlay;

  HeatMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HeatMapBloc>().add(GetHeatMapEvent());

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
                    return FutureBuilder<Tile>(
                        future: _getTile(state.heatmap),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Tile? tile = snapshot.data;
                            debugPrint("tile data ----> $tile");
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_sharp,
                                            size: 28,
                                          )),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      const Text(
                                        "HeatMap Analysis",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Image.memory(
                                            tile!.data!,
                                            width: tile.width.toDouble(),
                                            height: tile.height.toDouble(),
                                            fit: BoxFit.contain,
                                          )))
                                ],
                              ),
                            );
                          }
                          return Container();
                        });

                    // _tileOverlay = TileOverlay(
                    //   tileOverlayId: const TileOverlayId('tile_overlay'),
                    //   tileProvider: _CustomTileProvider(
                    //     response: state.heatmap,
                    //   ),
                    // );
                    // return SizedBox(
                    //     height: 256,
                    //     width: double.infinity,
                    //     child: GoogleMap(
                    //       onMapCreated: (GoogleMapController controller) {
                    //         _controller = controller;
                    //       },
                    //       initialCameraPosition: const CameraPosition(
                    //         target: LatLng(37.7749, -122.4194),
                    //         zoom: 2,
                    //       ),
                    //       mapType: MapType.none,
                    //       // ignore: prefer_collection_literals
                    //       tileOverlays: Set.of([_tileOverlay!]),
                    //     ));
                  }
                  return const SizedBox();
                }))));
  }

  Future<Tile> _getTile(Response response) async {
    final tileProvider = _CustomTileProvider(response: response);
    return await tileProvider.getTile(
        0, 0, 2); // Example coordinates and zoom level
  }
}

class _CustomTileProvider implements TileProvider {
  final Response response;

  _CustomTileProvider({
    required this.response,
  });

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    return Tile(
      256,
      256,
      response.data,
    );
  }
}
