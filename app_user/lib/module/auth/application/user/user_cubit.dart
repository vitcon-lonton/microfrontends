import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';
part 'user_cubit.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.notFound() = _NotFound;
  const factory UserState.inProgress() = _InProgress;
  const factory UserState.founded(User user) = _Founded;
}

class UserCubit extends Cubit<UserState> {
  UserCubit(this._authFacade) : super(const UserState.initial()) {
    getUserRequested();
  }

  final IAuthFacade _authFacade;

  Future<void> getUserRequested() async {
    emit(const UserState.inProgress());
    Option<User> userOption = await _authFacade.getSignedInUser();
    emit(userOption.fold(() {
      return const UserState.notFound();
    }, (user) => UserState.founded(user)));
  }
}
