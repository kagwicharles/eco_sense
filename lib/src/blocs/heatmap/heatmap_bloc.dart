import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecosense/src/repository/map_api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'heatmap_event.dart';
part 'heatmap_state.dart';

class HeatMapBloc extends Bloc<HeatMapEvent, HeatMapState> {
  HeatMapBloc() : super(HeatMapInitial()) {
    final MapApiRepository mapApiRepository = MapApiRepository();

    on<GetHeatMapEvent>(
        (GetHeatMapEvent event, Emitter<HeatMapState> emit) async {
      emit(HeatMapLoadingState());
      try {
        final heatmap = await mapApiRepository.getHeatMap();
        if (heatmap == null) {
          emit(HeatMapEmptyState());
        } else {
          emit(HeatMapLoadedState(heatmap: heatmap));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(HeatMapLoadingFailedState(errorMessage: message));
      }
    });
  }
}

String handleExceptionWithMessage(dynamic error) {
  if (error is SocketException) {
    return "It seems you are not connected to the internet.";
  } else if (error is TimeoutException) {
    return "The request timed out. Ensure you have a stable internet connection";
  } else {
    return "An error occurred, please try again";
  }
}
