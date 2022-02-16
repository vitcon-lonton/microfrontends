import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'theme_manager.dart';

part 'app_theme_cubit.freezed.dart';

@freezed
class ThemeTypeState with _$ThemeTypeState {
  const ThemeTypeState._();

  factory ThemeTypeState({@Default(ThemeType.light) ThemeType theme}) =
      _ThemeTypeState;

  factory ThemeTypeState.init() => ThemeTypeState();
}

class ThemeTypeCubit extends Cubit<ThemeTypeState> {
  ThemeTypeCubit() : super(ThemeTypeState.init());

  void themeChanged(ThemeType value) => emit(state.copyWith(theme: value));
}
