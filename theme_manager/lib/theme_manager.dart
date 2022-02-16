library theme_manager;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme_cubit.dart';
import 'widgets/widgets.dart';

export 'widgets/widgets.dart';
export 'app_theme_cubit.dart';

enum ThemeType { light, dark }

typedef AppThemeBuilder = Widget Function(ThemeType);

class ThemeManager {
  factory ThemeManager() => _instance;

  late final ThemeTypeCubit _cubit;

  @protected
  static final _instance = ThemeManager._();

  ThemeManager._() {
    _cubit = ThemeTypeCubit();
  }

  void changeTheme(ThemeType value) {
    _cubit.themeChanged(value);
  }

  Widget builder(AppThemeBuilder builder) {
    return BlocBuilder<ThemeTypeCubit, ThemeTypeState>(
      bloc: _cubit,
      builder: (_, state) => builder(state.theme),
      buildWhen: (prev, cur) => prev.theme != cur.theme,
    );
  }

  ThemeData buildTheme(ThemeType themeType) {
    if (themeType == ThemeType.dark) {
      return darkTheme;
    }

    return lightTheme;
  }
}
