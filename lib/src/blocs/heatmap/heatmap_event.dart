part of 'heatmap_bloc.dart';

abstract class HeatMapEvent extends Equatable {
  const HeatMapEvent();
  @override
  List<Object?> get props => [];
}

class GetHeatMapEvent extends HeatMapEvent {}
