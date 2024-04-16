import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/enums/weather_conditions_enums.dart';

class WeatherMainImageWidget extends StatelessWidget {
  const WeatherMainImageWidget(
      {super.key, required this.weatherCondition, this.height, this.width});
  final WeatherCondition weatherCondition;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      height: height ?? 100,
      child: Image.asset(weatherCondition == WeatherCondition.rainy
          ? "assets/rainy_animation.gif"
          : weatherCondition == WeatherCondition.sunny
              ? "assets/sunny_animation.gif"
              : weatherCondition == WeatherCondition.cloudy
                  ? "assets/rainy_animation.gif"
                  : "assets/sunny_animation.gif"),
    );
  }
}
