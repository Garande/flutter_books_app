import 'package:book_mate/blocs/app_settings_bloc.dart';
import 'package:book_mate/utils/app_palette.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        return MaterialApp(
          title: AppConstants.appName,
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildThemeButton(
                AppTheme.lightBlueTheme,
                _appTheme,
                'Light Blue',
              ),
              _buildThemeButton(
                AppTheme.darkBlueTheme,
                _appTheme,
                'Dark Blue',
              ),
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
