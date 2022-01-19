part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {}

class InitAppSettings extends AppSettingsEvent {
  @override
  List<Object?> get props => [];
}

class ToggleTheme extends AppSettingsEvent {
  final AppTheme? appTheme;

  ToggleTheme(this.appTheme);

  @override
  List<Object?> get props => [appTheme];
}

class ChangeLocale extends AppSettingsEvent {
  final Locale? locale;

  ChangeLocale(this.locale);
  @override
  List<Object?> get props => [];
}
