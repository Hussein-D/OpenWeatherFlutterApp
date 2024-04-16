import 'package:flutter/material.dart';
import 'package:open_weather_flutter_app/common_views/weather_main_image_widget.dart';
import 'package:open_weather_flutter_app/enums/weather_conditions_enums.dart';
import 'package:open_weather_flutter_app/responses/country_weather_details_model.dart';

class SingleDayWeatherLoadedCard extends StatelessWidget {
  const SingleDayWeatherLoadedCard({
    super.key,
    this.data,
  });
  final WeatherData? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 80,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey[200]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: WeatherMainImageWidget(
              width: 50,
              height: 50,
              weatherCondition: WeatherCondition.fromStringtoEnum(
                  data?.weather?.first.description ?? ""),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${data?.main?.temp ?? "0"} °C",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            getDay(
                DateTime.parse(data?.dtTxt ?? DateTime.now().toString()).weekday),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

String getDay(int dayOfWeek) {
  switch (dayOfWeek) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return "";
  }
}
