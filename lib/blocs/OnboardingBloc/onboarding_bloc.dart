import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._authBloc) : super(OnboardingInitial()) {
    on<CheckOnboardingEvent>(_onCheckOnboardingEvent);
    on<OnboardingDoneEvent>(_onOnboardingDoneEvent);

    _authBlocSubscription = _authBloc.stream.listen((AuthenticationState state) {
      if (state is AuthenticatedUser) {
        add(OnboardingDoneEvent());
      } else if (state is UnauthenticatedUser) {
        add(CheckOnboardingEvent());
      }
    });
  }

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocSubscription;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late bool _onboarding;

  Future<void> _onOnboardingDoneEvent(OnboardingDoneEvent event, Emitter<OnboardingState> emit) async {
    try {
      final SharedPreferences prefs = await _prefs;
      await prefs.setBool('onboarding', false);
      emit(OnboardingDoneState());
    } catch (e) {
      emit(IsOnboardingState());
    }
  }

  Future<void> _onCheckOnboardingEvent(CheckOnboardingEvent event, Emitter<OnboardingState> emit) async {
    try {
      final SharedPreferences prefs = await _prefs;
      _onboarding = prefs.getBool('onboarding') ?? true;
      _onboarding ? emit(IsOnboardingState()) : emit(OnboardingDoneState());
    } catch (e) {
      emit(IsOnboardingState());
    }
  }

  @override
  Future<void> close() {
    _authBlocSubscription?.cancel();
    return super.close();
  }
}
