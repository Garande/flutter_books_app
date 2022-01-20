import 'package:book_mate/blocs/settings/app_settings_bloc.dart';
import 'package:book_mate/l10n/l10n.dart';
import 'package:book_mate/utils/app_palette.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
          create: (context) => AppSettingsBloc()
            ..add(
              InitAppSettings(),
            ),
        ),
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
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
            builder: (context, state) {
          AppTheme? _appTheme;
          if (state is ThemeState) {
            _appTheme = state.appTheme;
          }

          Locale? _locale;
          if (state is LocaleState) {
            _locale = state.locale;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.sign_in,
                style: Theme.of(context).textTheme.headline2,
              ),

              _buildLocaleBtn(const Locale('en'), _locale, 'English'),
              _buildLocaleBtn(const Locale('hi'), _locale, 'Hindi'),
              _buildLocaleBtn(const Locale('ar'), _locale, 'Arabic'),

              // _buildThemeButton(
              //   AppTheme.lightBlueTheme,
              //   _appTheme,
              //   'Light Blue',
              // ),
              // _buildThemeButton(
              //   AppTheme.darkBlueTheme,
              //   _appTheme,
              //   'Dark Blue',
              // ),
              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLocaleBtn(Locale locale, Locale? currentLocale, String label) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AppSettingsBloc>(context).add(ChangeLocale(locale));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio<Locale>(
            activeColor: Theme.of(context).colorScheme.secondary,
            groupValue: currentLocale,
            value: locale,
            onChanged: (Locale? _locale) {},
          ),
          Text(
            label,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeButton(
      AppTheme theme, AppTheme? currentTheme, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<AppTheme>(
          activeColor: Theme.of(context).colorScheme.secondary,
          groupValue: currentTheme,
          value: theme,
          onChanged: (AppTheme? _theme) {
            BlocProvider.of<AppSettingsBloc>(context).add(ToggleTheme(_theme));
          },
        ),
        Text(
          label,
          style:
              Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
        ),
      ],
    );
  }
}
