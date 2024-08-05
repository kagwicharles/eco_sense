part of 'heatmap_bloc.dart';

abstract class HeatMapState extends Equatable {
  const HeatMapState();
  @override
  List<Object> get props => [];
}

class HeatMapInitial extends HeatMapState {}

class HeatMapLoadingState extends HeatMapState {}

class HeatMapLoadedState extends HeatMapState {
  const HeatMapLoadedState({required this.heatmap});
  final Response heatmap;
  @override
  List<Object> get props => [heatmap];
}

class HeatMapEmptyState extends HeatMapState {}

class HeatMapLoadingFailedState extends HeatMapState {
  const HeatMapLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
