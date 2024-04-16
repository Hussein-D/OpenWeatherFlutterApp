import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:open_weather_flutter_app/ApiManager/api_manager.dart';
import 'package:open_weather_flutter_app/ThemeManager/theme_manager.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/bloc/weather_bloc.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/weather_main_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  GetIt.I.registerSingleton(ApiManager());
  GetIt.I.registerSingleton(ThemeManager());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = GetIt.I<ThemeManager>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeManager.lightTheme,
        darkTheme: themeManager.darkTheme,
        home: BlocProvider(
          create: (context) => WeatherBloc(),
          child: const WeatherMainScreen(),
        ));
  }
}
