import 'package:book_mate/blocs/authentication/authentication_bloc.dart';
import 'package:book_mate/blocs/settings/app_settings_bloc.dart';
import 'package:book_mate/l10n/l10n.dart';
import 'package:book_mate/repositories/authentication_repository.dart';
import 'package:book_mate/route_generator.dart';
import 'package:book_mate/utils/app_palette.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/views/home/home_screen.dart';
import 'package:book_mate/views/sign_in/sign_in_screen.dart';
import 'package:book_mate/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _authenticationRepository = AuthenticationRepostory();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
          create: (context) => AppSettingsBloc()
            ..add(
              InitAppSettings(),
            ),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(_authenticationRepository)
            ..add(IsAuthenticated()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        AppTheme? _appTheme;
        if (state is ThemeState) {
          _appTheme = state.appTheme;
        }

        Locale? _locale;
        if (state is LocaleState) {
          _locale = state.locale;
        }

        return MaterialApp(
          title: AppConstants.appName,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale ?? const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppPalette.themeData[_appTheme] ??
              AppPalette.themeData[AppTheme.darkBlueTheme],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const HomeScreen();
              } else if (state is UnAuthenticated) {
                return const SignInScreen();
              } else {
                return const SplashScreen();
              }
            },
          ),
        );
      },
    );
  }
}
