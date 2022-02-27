// ignore_for_file: avoid_print

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/auth_failure.dart';
import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/value_objects.dart';

part 'request_new_otp_cubit.freezed.dart';

class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

@freezed
class RequestNewOtpState with _$RequestNewOtpState {
  const RequestNewOtpState._();

  factory RequestNewOtpState({
    required Phone phone,
    required int timeLeft,
    @Default(false) bool isAbleSubmit,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> failureOrSuccessOption,
  }) = _RequestNewOtpState;

  bool get valid => true;

  factory RequestNewOtpState.init() {
    return RequestNewOtpState(
      timeLeft: 0,
      isAbleSubmit: true,
      phone: Phone('0372560843'),
      failureOrSuccessOption: none(),
    );
  }
}

class RequestNewOtpCubit extends Cubit<RequestNewOtpState> {
  late final Ticker _ticker;
  final IAuthFacade _authFacade;
  StreamSubscription<int>? _tickerSubscription;

  RequestNewOtpCubit(this._authFacade) : super(RequestNewOtpState.init()) {
    _ticker = const Ticker();
    _tickerSubscription?.cancel();

    // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   final timeLeft = state.timeLeft;
    //   print(timeLeft);

    //   if (timer.tick == 60) {
    //     _timer.cancel();
    //     emit(state.copyWith(timeLeft: 0));
    //   } else {
    //     emit(state.copyWith(timeLeft: timeLeft - 1));
    //   }
    // });

    // _startCountDown();
    _tickerSubscription = _ticker.tick(ticks: 1).listen((duration) {
      // print(duration);
      emit(state.copyWith());
    });
  }

  _startCountDown() {
    emit(state.copyWith(timeLeft: 10));
    emit(state.copyWith(isAbleSubmit: false));

    Timer.periodic(const Duration(seconds: 1), (timer) {
      final timeLeft = state.timeLeft;
      print(timeLeft);

      if (timeLeft == 0) {
        timer.cancel();
        emit(state.copyWith(timeLeft: 0));
        emit(state.copyWith(isAbleSubmit: true));
      } else {
        emit(state.copyWith(timeLeft: timeLeft - 1));
      }
    });
  }

  phoneChanged(String value) => emit(state.copyWith(phone: Phone(value)));

  submitted() async {
    Either<AuthFailure, Unit> failureOrSuccess =
        const Right<AuthFailure, Unit>(unit);

    final phone = state.phone;
    final isPhoneValid = phone.isValid();
    final isAbleSubmit = state.isAbleSubmit;

    if (isPhoneValid && isAbleSubmit) {
      emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

      failureOrSuccess = await _authFacade.forgetPassword(phone: phone);
    }

    emit(state.copyWith(
      isSubmitting: false,
      failureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    failureOrSuccess.foldRight(null, (r, previous) => _startCountDown());
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
