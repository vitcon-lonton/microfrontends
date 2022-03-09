import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';
part 'user_cubit.freezed.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  factory UserState(
      {@Default(false) bool isLoading,
      required Option<User> userOption}) = _UserState;

  User? get user => userOption.fold(() => null, (user) => user);

  factory UserState.init() => UserState(userOption: none());
}

class UserCubit extends Cubit<UserState> {
  final IAuthFacade _authFacade;

  UserCubit(this._authFacade) : super(UserState.init()) {
    getUserRequested();
  }

  getUserRequested() async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(userOption: none()));

    Option<User> userOption = await _authFacade.getSignedInUser();

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(userOption: userOption));
  }
}
