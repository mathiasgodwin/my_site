// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_theme_cubit.dart';

class AppThemeState extends Equatable {
  const AppThemeState({
    this.appTheme = AppTheme.purpleLight,
    this.mode = ThemeMode.system,
  });
  final AppTheme appTheme;
  final ThemeMode mode;

  @override
  List<Object?> get props => [appTheme, mode];

  AppThemeState copyWith({
    AppTheme? appTheme,
    ThemeMode? mode,
  }) {
    return AppThemeState(
      appTheme: appTheme ?? this.appTheme,
      mode: mode ?? this.mode,
    );
  }
}
