part of 'app_settings_bloc.dart';

abstract class AppSettingsState extends Equatable {}

class UnInitializedState extends AppSettingsState {
  @override
  List<Object?> get props => [];
}

class ThemeState extends AppSettingsState {
  final AppTheme appTheme;

  ThemeState(this.appTheme);

  @override
  List<Object?> get props => [appTheme];
}

class LocaleState extends AppSettingsState {
  final Locale locale;

  LocaleState(this.locale);
  @override
  List<Object?> get props => [locale];
}
