import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service/domain/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<SignedOut>(_onSignedOut);
    on<AuthCheckRequested>(_onAuthCheckRequested);
  }

  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onAuthCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    final userOption = await _authFacade.getSignedInUser();

    emit(userOption.fold(
      () => const AuthState.unauthenticated(),
      (_) => const AuthState.authenticated(),
    ));
  }
}

// AuthBloc(this._authFacade) : super(const AuthState.initial());

// @override
// Stream<AuthState> mapEventToState(
//   AuthEvent event,
// ) async* {
//   yield* event.map(
//     authCheckRequested: (e) async* {
//       final userOption = await _authFacade.getSignedInUser();
//       yield userOption.fold(
//         () => const AuthState.unauthenticated(),
//         (_) => const AuthState.authenticated(),
//       );
//     },
//     signedOut: (e) async* {
//       await _authFacade.signOut();
//       yield const AuthState.unauthenticated();
//     },
//   );
// }