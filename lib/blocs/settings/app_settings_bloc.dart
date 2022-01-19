import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_mate/utils/app_palette.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(ThemeState(AppTheme.lightBlueTheme)) {
    on<InitAppSettings>(_handleSettingsInitialization);
    on<ToggleTheme>(_handleThemeChange);
    on<ChangeLocale>(_handleLocaleChange);
  }

  FutureOr<void> _handleSettingsInitialization(
      InitAppSettings event, Emitter<AppSettingsState> emit) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? themeString = _preferences.getString('APP_THEME');
    AppTheme? _theme;
    AppConstants.themeStrings.forEach((key, value) {
      if (value == themeString) {
        _theme = key;
      }
    });
    if (_theme != null) {
      emit(ThemeState(_theme!));
    }
  }

  FutureOr<void> _handleThemeChange(
      ToggleTheme event, Emitter<AppSettingsState> emit) async {
    AppTheme? _theme = event.appTheme;
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      // _preferences.se
      if (_theme != null) {
        _preferences.setString("APP_THEME", AppConstants.themeStrings[_theme]!);
        emit(ThemeState(_theme));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<FutureOr<void>> _handleLocaleChange(
      ChangeLocale event, Emitter<AppSettingsState> emit) async {
    Locale? locale = event.locale;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (locale != null) {
      _pref.setString('APP_LOCALE', locale.languageCode);
      emit(LocaleState(locale));
    }
  }
}
