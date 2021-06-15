import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial());

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is NavigateToHomeScreenEvent) {
      yield Loading();

      await Future.delayed(
        Duration(seconds: 4),
      );

      yield Loaded();
    }
  }
}
