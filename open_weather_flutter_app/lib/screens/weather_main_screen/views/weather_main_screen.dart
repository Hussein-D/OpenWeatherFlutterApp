import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/bloc/weather_bloc.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/weather_error_widget.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/weather_loaded_widget.dart';
import 'package:open_weather_flutter_app/screens/weather_main_screen/views/weather_loading_widget.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(LoadWeatherDetails(cityName: "Lebanon"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoaded) {
              return WeatherLoadedWidget(
                  countryWeatherDetails: state.countryWeatherDetails);
            } else if (state is WeatherLoading) {
              return const WeatherLoadingWidget();
            } else if (state is WeatherError) {
              return const WeatherErrorWidget();
            } else {
              return const WeatherLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
