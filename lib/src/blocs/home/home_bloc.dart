import 'dart:async';
import 'dart:io';

import 'package:ecosense/src/repository/prompt_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final PromptRepository promptRepository = PromptRepository();

    on<GetActionsEvent>((GetActionsEvent event, Emitter<HomeState> emit) async {
      emit(HomeLoadingState());
      try {
        final actions =
            await promptRepository.generateClimateActionIdeas() ?? [];
        if (actions.isEmpty) {
          emit(HomeEmptyState());
        } else {
          emit(HomeLoadedState(actions: actions));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(HomeLoadingFailedState(errorMessage: message));
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
