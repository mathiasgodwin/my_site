import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_site/src/util/ui/theme/theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends HydratedCubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeState());

  void switchTheme(AppTheme theme) {
    emit(state.copyWith(appTheme: theme));
  }

  void switchThemeMode(ThemeMode mode) {
    emit(state.copyWith(mode: mode));
  }

  @override
  AppThemeState? fromJson(Map<String, dynamic> json) {
    return AppThemeState(
      appTheme: AppTheme.deserialize(json['themeId'] as String?),
      mode: ThemeModeX.deserialize(json['modeId'] as String?),
    );
  }

  @override
  Map<String, dynamic>? toJson(AppThemeState state) {
    return {
      'themeId': state.appTheme.serialize,
      'modeId': state.mode.serialize,
    };
  }
}
