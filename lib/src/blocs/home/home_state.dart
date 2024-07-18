part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState({required this.actions});
  final List<String> actions;
  @override
  List<Object> get props => [actions];
}

class HomeEmptyState extends HomeState {}

class HomeLoadingFailedState extends HomeState {
  const HomeLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
